@testset "zunik" begin
    max_abs = 0.0
    max_rel = 0.0
    max_eps_ratio = 0.0
    for z in ZS[1:8], ik in (1, 2), fnu in (0.0, 0.5, 1.2)
        jvals = zunik(real(z), imag(z), fnu, ik, 0, 1e-14, 0)
        cvals = c_zunik(real(z), imag(z), fnu, Int32(ik), Int32(0), 1e-14, Int32(0))
        for (j, c) in zip(jvals, cvals)
            if isnan(j) && isnan(c)
                @test true
            elseif isfinite(j) && isfinite(c)
                @test approx_or(j, c)
                da = abs(j - c)
                dr = da / max(abs(j), abs(c), EPS64)
                er = da / (EPS64 * max(abs(j), abs(c), 1.0))
                max_abs = max(max_abs, da)
                max_rel = max(max_rel, dr)
                max_eps_ratio = max(max_eps_ratio, er)
            else
                @test !isfinite(j) || !isfinite(c)
            end
        end
    end
    println("zunik deviation: max_abs=", max_abs, " max_rel=", max_rel, " max_eps_ratio=", max_eps_ratio, " eps=", EPS64)
end


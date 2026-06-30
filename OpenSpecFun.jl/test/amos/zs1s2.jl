@testset "zs1s2" begin
    max_abs = 0.0
    max_rel = 0.0
    for s1r in (-0.5, 0.0, 1.0), s1i in (-0.2, 0.3), s2r in (-0.1, 0.4), s2i in (-0.7, 0.6)
        r, i, nzo, iufo = zs1s2(0.7, -0.1, s1r, s1i, s2r, s2i, 0, 1.0, 700.0, 0)
        cr, ci, cnzo, ciufo = c_zs1s2(0.7, -0.1, s1r, s1i, s2r, s2i, Int32(0), 1.0, 700.0, Int32(0))
        @test approx_or(r, cr)
        @test approx_or(i, ci)
        @test nzo == cnzo
        @test iufo == ciufo
        max_abs = max(max_abs,
            abs(r - cr), abs(i - ci),
            abs(Float64(nzo) - Float64(cnzo)), abs(Float64(iufo) - Float64(ciufo)))
        max_rel = max(max_rel,
            abs(r - cr) / max(abs(r), abs(cr), EPS64),
            abs(i - ci) / max(abs(i), abs(ci), EPS64),
            abs(Float64(nzo) - Float64(cnzo)) / max(abs(Float64(nzo)), abs(Float64(cnzo)), EPS64),
            abs(Float64(iufo) - Float64(ciufo)) / max(abs(Float64(iufo)), abs(Float64(ciufo)), EPS64))
    end
    println("zs1s2 deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end

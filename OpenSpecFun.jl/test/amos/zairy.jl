@testset "zairy" begin
    max_abs = 0.0
    max_rel = 0.0
    for id in (0, 1), kode in (1, 2), z in (ComplexF64(0.2, 0.1), ComplexF64(0.8, -0.3), ComplexF64(1.3, 0.4))
        air, aii, nz, ierr = zairy(real(z), imag(z), id, kode)
        cair, caii, cnz, cierr = c_zairy(real(z), imag(z), Int32(id), Int32(kode))
        @test isfinite(air)
        @test isfinite(aii)
        @test nz == cnz
        @test ierr == cierr
        @test approx_or(air, cair)
        @test approx_or(aii, caii)
        max_abs = max(max_abs, abs(air - cair), abs(aii - caii))
        max_rel = max(max_rel,
            abs(air - cair) / max(abs(air), abs(cair), EPS64),
            abs(aii - caii) / max(abs(aii), abs(caii), EPS64))
    end
    println("zairy deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


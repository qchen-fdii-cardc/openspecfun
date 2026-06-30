@testset "zbiry" begin
    max_abs = 0.0
    max_rel = 0.0
    for id in (0, 1), kode in (1, 2), z in (ComplexF64(0.2, 0.1), ComplexF64(0.8, -0.3), ComplexF64(1.3, 0.4))
        bir, bii, ierr = zbiry(real(z), imag(z), id, kode)
        cbir, cbii, cierr = c_zbiry(real(z), imag(z), Int32(id), Int32(kode))
        @test isfinite(bir)
        @test isfinite(bii)
        @test ierr == cierr
        @test approx_or(bir, cbir)
        @test approx_or(bii, cbii)
        max_abs = max(max_abs, abs(bir - cbir), abs(bii - cbii))
        max_rel = max(max_rel,
            abs(bir - cbir) / max(abs(bir), abs(cbir), EPS64),
            abs(bii - cbii) / max(abs(bii), abs(cbii), EPS64))
    end
    println("zbiry deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


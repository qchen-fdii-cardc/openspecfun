@testset "zbesy" begin
    max_abs = 0.0
    max_rel = 0.0
    for z in (ComplexF64(0.3, 0.2), ComplexF64(1.0, -0.5), ComplexF64(0.7, 0.9))
        yr, yi, nz, cwrkr, cwrki, ierr = zbesy(real(z), imag(z), 0.5, 1, 3)
        cyr, cyi, cnz, ccwrkr, ccwrki, cierr = c_zbesy(real(z), imag(z), 0.5, Int32(1), Int32(3))
        @test length(yr) == 3
        @test length(yi) == 3
        @test length(cwrkr) == 3
        @test length(cwrki) == 3
        @test nz == cnz
        @test ierr == cierr
        @test approx_or(yr, cyr)
        @test approx_or(yi, cyi)
        max_abs = max(max_abs,
            maximum(abs.(yr .- cyr)), maximum(abs.(yi .- cyi)))
        max_rel = max(max_rel,
            maximum(abs.(yr .- cyr) ./ max.(abs.(yr), abs.(cyr), EPS64)),
            maximum(abs.(yi .- cyi) ./ max.(abs.(yi), abs.(cyi), EPS64)))
        @test all(isfinite, cwrkr)
        @test all(isfinite, cwrki)
        @test all(isfinite, ccwrkr)
        @test all(isfinite, ccwrki)
    end
    println("zbesy deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


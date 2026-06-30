@testset "zbesk" begin
    max_abs = 0.0
    max_rel = 0.0
    for z in (ComplexF64(0.2, 0.1), ComplexF64(1.1, -0.4), ComplexF64(0.8, 0.9))
        yr, yi, nz, ierr = zbesk(real(z), imag(z), 0.5, 1, 3)
        cyr, cyi, cnz, cierr = c_zbesk(real(z), imag(z), 0.5, Int32(1), Int32(3))
        @test length(yr) == 3
        @test length(yi) == 3
        @test nz == cnz
        @test ierr == cierr
        @test approx_or(yr, cyr)
        @test approx_or(yi, cyi)
        max_abs = max(max_abs, maximum(abs.(yr .- cyr)), maximum(abs.(yi .- cyi)))
        max_rel = max(max_rel,
            maximum(abs.(yr .- cyr) ./ max.(abs.(yr), abs.(cyr), EPS64)),
            maximum(abs.(yi .- cyi) ./ max.(abs.(yi), abs.(cyi), EPS64)))
    end
    println("zbesk deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


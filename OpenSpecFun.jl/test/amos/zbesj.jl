@testset "zbesj" begin
    max_abs = 0.0
    max_rel = 0.0
    for z in ZS
        yr, yi, nz, ierr = zbesj(real(z), imag(z), 0.0, 1, 4)
        cyr, cyi, cnz, cierr = c_zbesj(real(z), imag(z), 0.0, Int32(1), Int32(4))
        @test length(yr) == 4
        @test length(yi) == 4
        @test nz == cnz
        @test ierr == cierr
        @test approx_or(yr, cyr)
        @test approx_or(yi, cyi)
        max_abs = max(max_abs, maximum(abs.(yr .- cyr)), maximum(abs.(yi .- cyi)))
        max_rel = max(max_rel,
            maximum(abs.(yr .- cyr) ./ max.(abs.(yr), abs.(cyr), EPS64)),
            maximum(abs.(yi .- cyi) ./ max.(abs.(yi), abs.(cyi), EPS64)))
    end
    println("zbesj deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


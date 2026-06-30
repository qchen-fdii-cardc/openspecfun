@testset "zbesh" begin
    max_abs = 0.0
    max_rel = 0.0
    for m in (1, 2), z in (ComplexF64(0.4, 0.2), ComplexF64(1.1, -0.6), ComplexF64(0.9, 0.8))
        yr, yi, nz, ierr = zbesh(real(z), imag(z), 0.5, 1, m, 3)
        cyr, cyi, cnz, cierr = c_zbesh(real(z), imag(z), 0.5, Int32(1), Int32(m), Int32(3))
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
    println("zbesh deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


@testset "zacai" begin
    for z in (ComplexF64(0.3, 0.2), ComplexF64(1.0, -0.5), ComplexF64(0.7, 0.9))
        y1r, y1i, nz1, _ = zbesk(real(z), imag(z), 0.5, 1, 3)
        y2r, y2i, nz2 = zacai(real(z), imag(z), 0.5, 1, 1, 3, 0.0, 1e-14, 700.0, 650.0)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
        @test nz2 == nz1
    end
end


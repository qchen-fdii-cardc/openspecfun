@testset "zbknu" begin
    for z in (ComplexF64(0.3, 0.2), ComplexF64(1.0, -0.5), ComplexF64(0.7, 0.9))
        y1r, y1i, nz1, ierr1 = zbesk(real(z), imag(z), 0.5, 1, 3)
        y2r, y2i, nz2, ierr2 = zbknu(real(z), imag(z), 0.5, 1, 3, 1e-14, 700.0, 650.0)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
        @test (nz2, ierr2) == (nz1, ierr1)
    end
end


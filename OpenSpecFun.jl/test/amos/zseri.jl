@testset "zseri" begin
    for z in ZS[1:6]
        y1r, y1i, nz1, ierr1 = zbesi(real(z), imag(z), 0.0, 1, 3)
        y2r, y2i, nz2, ierr2 = zseri(real(z), imag(z), 0.0, 1, 3, 1e-14, 700.0, 650.0)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
        @test (nz2, ierr2) == (nz1, ierr1)
    end
end


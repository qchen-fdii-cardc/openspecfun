@testset "zmlri" begin
    for z in ZS[1:6]
        y1r, y1i, nz1, ierr1 = zbesi(real(z), imag(z), 0.0, 1, 3)
        y2r, y2i, nz2, ierr2 = zmlri(real(z), imag(z), 0.0, 1, 3, 1e-14)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
        @test (nz2, ierr2) == (nz1, ierr1)
    end
end


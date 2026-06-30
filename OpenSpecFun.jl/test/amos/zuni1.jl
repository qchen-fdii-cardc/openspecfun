@testset "zuni1" begin
    for z in ZS[1:6]
        y1r, y1i, nz1, _ = zbesi(real(z), imag(z), 0.0, 1, 3)
        y2r, y2i, nz2, nlast = zuni1(real(z), imag(z), 0.0, 1, 3, 0.0, 1e-14, 700.0, 650.0)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
        @test nz2 == nz1
        @test nlast == 0
    end
end


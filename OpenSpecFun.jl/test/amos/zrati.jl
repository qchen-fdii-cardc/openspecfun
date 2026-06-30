@testset "zrati" begin
    for z in ZS[1:6]
        y1r, y1i, _, _ = zbesi(real(z), imag(z), 0.0, 1, 3)
        y2r, y2i = zrati(real(z), imag(z), 0.0, 3, 1e-14)
        @test approx_or(y2r, y1r)
        @test approx_or(y2i, y1i)
    end
end


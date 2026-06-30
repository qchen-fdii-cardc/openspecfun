@testset "zuoik" begin
    for z in ZS[1:6]
        yi1r, yi1i, _, _ = zbesi(real(z), imag(z), 0.0, 1, 3)
        yi2r, yi2i, nuf1 = zuoik(real(z), imag(z), 0.0, 1, 1, 3, 1e-14, 700.0, 650.0)
        @test approx_or(yi2r, yi1r)
        @test approx_or(yi2i, yi1i)
        @test nuf1 == 0

        yk1r, yk1i, _, _ = zbesk(real(z), imag(z), 0.5, 1, 3)
        yk2r, yk2i, nuf2 = zuoik(real(z), imag(z), 0.5, 1, 2, 3, 1e-14, 700.0, 650.0)
        @test approx_or(yk2r, yk1r)
        @test approx_or(yk2i, yk1i)
        @test nuf2 == 0
    end
end


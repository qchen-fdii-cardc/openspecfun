@testset "zshch" begin
    for zr in (-1.2, -0.3, 0.5, 1.1), zi in (-0.7, 0.2, 0.9)
        jshr, jshi, jchr, jchi = zshch(zr, zi)
        cshr, cshi, cchr, cchi = c_zshch(zr, zi)
        @test approx_or(jshr, cshr)
        @test approx_or(jshi, cshi)
        @test approx_or(jchr, cchr)
        @test approx_or(jchi, cchi)
    end
end


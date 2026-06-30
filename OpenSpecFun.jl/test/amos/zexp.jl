@testset "zexp" begin
    for ar in (-1.0, 0.0, 1.5), ai in (-1.2, -0.1, 0.9)
        jbr, jbi = zexp(ar, ai)
        cbr, cbi = c_zexp(ar, ai)
        @test approx_or(jbr, cbr)
        @test approx_or(jbi, cbi)
    end
end


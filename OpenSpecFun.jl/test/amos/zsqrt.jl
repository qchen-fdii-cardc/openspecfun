@testset "zsqrt" begin
    for ar in (0.1, 1.5, 4.0), ai in (-2.0, -0.2, 0.7)
        jsrr, jsri = zsqrt(ar, ai)
        csrr, csri = c_zsqrt(ar, ai)
        @test approx_or(jsrr, csrr)
        @test approx_or(jsri, csri)
    end
end


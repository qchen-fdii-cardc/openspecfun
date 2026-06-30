@testset "zdiv" begin
    for ar in (-1.5, 0.2, 2.0), ai in (-0.7, 0.4), br in (0.8, 2.5), bi in (-1.1, 0.6)
        jcr, jci = zdiv(ar, ai, br, bi)
        ccr, cci = c_zdiv(ar, ai, br, bi)
        @test approx_or(jcr, ccr)
        @test approx_or(jci, cci)
    end
end


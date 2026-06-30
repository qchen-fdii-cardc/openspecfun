@testset "zmlt" begin
    for ar in (-1.0, 0.3, 2.2), ai in (-1.7, 0.2), br in (-0.4, 1.1), bi in (-0.9, 0.5)
        jmtr, jmti = zmlt(ar, ai, br, bi)
        cmtr, cmti = c_zmlt(ar, ai, br, bi)
        @test approx_or(jmtr, cmtr)
        @test approx_or(jmti, cmti)
    end
end


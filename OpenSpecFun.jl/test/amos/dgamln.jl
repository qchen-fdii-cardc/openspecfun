@testset "dgamln" begin
    for x in (0.1, 0.3, 0.7, 1.2, 2.5, 5.0, 10.0)
        @test approx_or(dgamln(x), c_dgamln(x))
    end
end


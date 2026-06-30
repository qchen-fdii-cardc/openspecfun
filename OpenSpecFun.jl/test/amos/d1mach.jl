@testset "d1mach" begin
    vals = ntuple(i -> d1mach(i), 5)

    # Semantic contract from AMOS D1MACH documentation.
    @test all(isfinite, vals)
    @test vals[1] > 0.0
    @test vals[2] > vals[1]
    @test vals[3] > 0.0
    @test vals[4] > vals[3]
    @test vals[3] < 1.0
    @test vals[4] < 1.0
    @test 0.0 < vals[5] < 1.0
end


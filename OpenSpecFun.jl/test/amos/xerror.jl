@testset "xerror" begin
    for msg in ("warn", "error", "amos")
        xerror(msg, length(msg), 0, 0)
    end
    @test true
end


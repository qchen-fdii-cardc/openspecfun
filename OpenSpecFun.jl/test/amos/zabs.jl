@testset "zabs" begin
    for zr in (-3.0, -1.0, 0.0, 2.0), zi in (-4.0, -0.5, 0.3, 3.0)
        @test approx_or(zabs(zr, zi), c_zabs(zr, zi))
    end
end


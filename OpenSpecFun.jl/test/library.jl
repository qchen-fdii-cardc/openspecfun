@testset "library" begin
    @test isfile(LIB)
    @test length(EXPORTED_SYMBOLS) == 51
end

const EPS64 = eps(Float64)
const ATOL = 2 * EPS64
const RTOL = 2 * EPS64

# Shared grids cover near-zero, moderate magnitude, and signed inputs.
const XS = [-1.5, -1.2, -0.8, -0.2, -1e-12, 0.0, 1e-12, 0.2, 0.8, 1.2, 1.5]
const ZS = [ComplexF64(x, y) for x in (-1.2, -0.6, -1e-12, 0.0, 1e-12, 0.7, 1.3) for y in (-1.1, -0.4, -1e-12, 0.0, 1e-12, 0.5, 1.0)]


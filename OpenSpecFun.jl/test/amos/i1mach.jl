@testset "i1mach" begin
    for i in (1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15)
        @test i1mach(i) == c_i1mach(Int32(i))
    end
    # Platform-dependent entries in AMOS I1MACH tables.
    @test i1mach(3) in (0, 7)
    @test i1mach(4) in (0, 6)
    @test abs(i1mach(13) - c_i1mach(Int32(13))) <= 1
    @test abs(i1mach(16) - c_i1mach(Int32(16))) <= 1
end


@testset "zlog" begin
    for ar in (0.2, 1.0, 3.0), ai in (-2.0, -0.5, 0.8)
        jlgr, jlgi, jli = zlog(ar, ai)
        clgr, clgi, cli = c_zlog(ar, ai)
        @test approx_or(jlgr, clgr)
        @test approx_or(jlgi, clgi)
        @test jli == cli
    end
end


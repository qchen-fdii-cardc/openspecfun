@testset "zuchk" begin
    max_abs = 0.0
    max_rel = 0.0
    for (yr, yi, nz, ascle, tol) in ((0.1, 0.1, 0, 1.0, 1e-14), (2.0, 0.0, 3, 1.0, 1e-14), (0.5, 0.4, 2, 1.0, 1e-14))
        j = zuchk(yr, yi, nz, ascle, tol)
        c = c_zuchk(yr, yi, Int32(nz), ascle, tol)
        @test j == c
        da = abs(Float64(j) - Float64(c))
        dr = da / max(abs(Float64(j)), abs(Float64(c)), EPS64)
        max_abs = max(max_abs, da)
        max_rel = max(max_rel, dr)
    end
    println("zuchk deviation: max_abs=", max_abs, " max_rel=", max_rel, " eps=", EPS64)
end


@testset "faddeeva_w" begin
    for z in ZS
        @test approx_or(faddeeva_w(z), c_faddeeva_w(z))
    end
end

@testset "faddeeva_w_im" begin
    for x in XS
        @test approx_or(faddeeva_w_im(x), c_faddeeva_w_im(x))
    end
end

@testset "faddeeva_erfcx" begin
    for z in ZS
        @test approx_or(faddeeva_erfcx(z), c_faddeeva_erfcx(z))
    end
end

@testset "faddeeva_erfcx_re" begin
    for x in XS
        @test approx_or(faddeeva_erfcx_re(x), c_faddeeva_erfcx_re(x))
    end
end

@testset "faddeeva_erf" begin
    for z in ZS
        @test approx_or(faddeeva_erf(z), c_faddeeva_erf(z))
    end
end

@testset "faddeeva_erf_re" begin
    for x in XS
        @test approx_or(faddeeva_erf_re(x), c_faddeeva_erf_re(x))
    end
end

@testset "faddeeva_erfi" begin
    for z in ZS
        @test approx_or(faddeeva_erfi(z), c_faddeeva_erfi(z))
    end
end

@testset "faddeeva_erfi_re" begin
    for x in XS
        @test approx_or(faddeeva_erfi_re(x), c_faddeeva_erfi_re(x))
    end
end

@testset "faddeeva_erfc" begin
    for z in ZS
        @test approx_or(faddeeva_erfc(z), c_faddeeva_erfc(z))
    end
end

@testset "faddeeva_erfc_re" begin
    for x in XS
        @test approx_or(faddeeva_erfc_re(x), c_faddeeva_erfc_re(x))
    end
end

@testset "faddeeva_dawson" begin
    for z in ZS
        @test approx_or(faddeeva_dawson(z), c_faddeeva_dawson(z))
    end
end

@testset "faddeeva_dawson_re" begin
    for x in XS
        @test approx_or(faddeeva_dawson_re(x), c_faddeeva_dawson_re(x))
    end
end


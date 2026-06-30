using Test
using OpenSpecFun

@inline approx_or(a, b) = isapprox(a, b; atol=ATOL) || isapprox(a, b; rtol=RTOL)

const LIB = joinpath(@__DIR__, "..", "..", "build", "libopenspecfun.so")

# ---------- ccall reference helpers ----------
function c_faddeeva_w(z::ComplexF64)
    ccall((:Faddeeva_w, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_w_im(x::Float64)
    ccall((:Faddeeva_w_im, LIB), Cdouble, (Cdouble,), x)
end

function c_faddeeva_erfcx(z::ComplexF64)
    ccall((:Faddeeva_erfcx, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_erfcx_re(x::Float64)
    ccall((:Faddeeva_erfcx_re, LIB), Cdouble, (Cdouble,), x)
end

function c_faddeeva_erf(z::ComplexF64)
    ccall((:Faddeeva_erf, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_erf_re(x::Float64)
    ccall((:Faddeeva_erf_re, LIB), Cdouble, (Cdouble,), x)
end

function c_faddeeva_erfi(z::ComplexF64)
    ccall((:Faddeeva_erfi, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_erfi_re(x::Float64)
    ccall((:Faddeeva_erfi_re, LIB), Cdouble, (Cdouble,), x)
end

function c_faddeeva_erfc(z::ComplexF64)
    ccall((:Faddeeva_erfc, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_erfc_re(x::Float64)
    ccall((:Faddeeva_erfc_re, LIB), Cdouble, (Cdouble,), x)
end

function c_faddeeva_dawson(z::ComplexF64)
    ccall((:Faddeeva_Dawson, LIB), ComplexF64, (ComplexF64, Cdouble), z, 0.0)
end

function c_faddeeva_dawson_re(x::Float64)
    ccall((:Faddeeva_Dawson_re, LIB), Cdouble, (Cdouble,), x)
end

function c_d1mach(i::Int32)
    ccall((:d1mach_, LIB), Cdouble, (Ref{Int32},), Ref(i))
end

function c_i1mach(i::Int32)
    ccall((:i1mach_, LIB), Int32, (Ref{Int32},), Ref(i))
end

function c_dgamln(z::Float64)
    ierr = Ref{Int32}(0)
    ccall((:dgamln_, LIB), Cdouble, (Ref{Cdouble}, Ref{Int32}), Ref(z), ierr)
end

function c_zabs(zr::Float64, zi::Float64)
    ccall((:zabs_, LIB), Cdouble, (Ref{Cdouble}, Ref{Cdouble}), Ref(zr), Ref(zi))
end

function c_zdiv(ar::Float64, ai::Float64, br::Float64, bi::Float64)
    cr = Ref{Cdouble}(0.0)
    ci = Ref{Cdouble}(0.0)
    ccall((:zdiv_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(ar), Ref(ai), Ref(br), Ref(bi), cr, ci)
    return cr[], ci[]
end

function c_zexp(ar::Float64, ai::Float64)
    br = Ref{Cdouble}(0.0)
    bi = Ref{Cdouble}(0.0)
    ccall((:zexp_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(ar), Ref(ai), br, bi)
    return br[], bi[]
end

function c_zlog(ar::Float64, ai::Float64)
    br = Ref{Cdouble}(0.0)
    bi = Ref{Cdouble}(0.0)
    ierr = Ref{Int32}(0)
    ccall((:zlog_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}),
        Ref(ar), Ref(ai), br, bi, ierr)
    return br[], bi[], ierr[]
end

function c_zmlt(ar::Float64, ai::Float64, br::Float64, bi::Float64)
    cr = Ref{Cdouble}(0.0)
    ci = Ref{Cdouble}(0.0)
    ccall((:zmlt_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(ar), Ref(ai), Ref(br), Ref(bi), cr, ci)
    return cr[], ci[]
end

function c_zsqrt(ar::Float64, ai::Float64)
    br = Ref{Cdouble}(0.0)
    bi = Ref{Cdouble}(0.0)
    ccall((:zsqrt_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(ar), Ref(ai), br, bi)
    return br[], bi[]
end

function c_zshch(zr::Float64, zi::Float64)
    cshr = Ref{Cdouble}(0.0)
    cshi = Ref{Cdouble}(0.0)
    cchr = Ref{Cdouble}(0.0)
    cchi = Ref{Cdouble}(0.0)
    ccall((:zshch_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(zr), Ref(zi), cshr, cshi, cchr, cchi)
    return cshr[], cshi[], cchr[], cchi[]
end

function c_zbesi(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, n::Int32)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zbesi_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(n), cyr, cyi, nz, ierr)
    return cyr, cyi, nz[], ierr[]
end

function c_zbesj(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, n::Int32)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zbesj_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(n), cyr, cyi, nz, ierr)
    return cyr, cyi, nz[], ierr[]
end

function c_zbesk(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, n::Int32)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zbesk_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(n), cyr, cyi, nz, ierr)
    return cyr, cyi, nz[], ierr[]
end

function c_zbesy(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, n::Int32)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    cwrkr = zeros(Cdouble, n)
    cwrki = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zbesy_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(n), cyr, cyi, nz, cwrkr, cwrki, ierr)
    return cyr, cyi, nz[], cwrkr, cwrki, ierr[]
end

function c_zbesh(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, m::Int32, n::Int32)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zbesh_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(m), Ref(n), cyr, cyi, nz, ierr)
    return cyr, cyi, nz[], ierr[]
end

function c_zairy(zr::Float64, zi::Float64, id::Int32, kode::Int32)
    air = Ref{Cdouble}(0.0)
    aii = Ref{Cdouble}(0.0)
    nz = Ref{Int32}(0)
    ierr = Ref{Int32}(0)
    ccall((:zairy_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(id), Ref(kode), air, aii, nz, ierr)
    return air[], aii[], nz[], ierr[]
end

function c_zbiry(zr::Float64, zi::Float64, id::Int32, kode::Int32)
    bir = Ref{Cdouble}(0.0)
    bii = Ref{Cdouble}(0.0)
    ierr = Ref{Int32}(0)
    ccall((:zbiry_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}),
        Ref(zr), Ref(zi), Ref(id), Ref(kode), bir, bii, ierr)
    return bir[], bii[], ierr[]
end

function c_zrati(zr::Float64, zi::Float64, fnu::Float64, n::Int32, tol::Float64)
    cyr = zeros(Cdouble, n)
    cyi = zeros(Cdouble, n)
    ccall((:zrati_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Cdouble}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(n), cyr, cyi, Ref(tol))
    return cyr, cyi
end

function c_zwrsk(zr::Float64, zi::Float64, fnu::Float64, kode::Int32, n::Int32, tol::Float64, elim::Float64, alim::Float64)
    yr = zeros(Cdouble, n)
    yi = zeros(Cdouble, n)
    nz = Ref{Int32}(0)
    cwr = zeros(Cdouble, 2)
    cwi = zeros(Cdouble, 2)
    ccall((:zwrsk_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Int32}, Ptr{Cdouble}, Ptr{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(kode), Ref(n), yr, yi, nz, cwr, cwi, Ref(tol), Ref(elim), Ref(alim))
    return yr, yi, nz[]
end

function c_zunik(zr::Float64, zi::Float64, fnu::Float64, ikflg::Int32, ipmtr::Int32, tol::Float64, init::Int32)
    phir = Ref{Cdouble}(0.0)
    phii = Ref{Cdouble}(0.0)
    zeta1r = Ref{Cdouble}(0.0)
    zeta1i = Ref{Cdouble}(0.0)
    zeta2r = Ref{Cdouble}(0.0)
    zeta2i = Ref{Cdouble}(0.0)
    sumr = Ref{Cdouble}(0.0)
    sumi = Ref{Cdouble}(0.0)
    cwrkr = zeros(Cdouble, 16)
    cwrki = zeros(Cdouble, 16)
    init_ref = Ref{Int32}(init)
    ccall((:zunik_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Int32}, Ref{Cdouble}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(ikflg), Ref(ipmtr), Ref(tol), init_ref, phir, phii, zeta1r, zeta1i, zeta2r, zeta2i, sumr, sumi, cwrkr, cwrki)
    return phir[], phii[], zeta1r[], zeta1i[], zeta2r[], zeta2i[], sumr[], sumi[]
end

function c_zunhj(zr::Float64, zi::Float64, fnu::Float64, ipmtr::Int32, tol::Float64)
    phir = Ref{Cdouble}(0.0)
    phii = Ref{Cdouble}(0.0)
    argr = Ref{Cdouble}(0.0)
    argi = Ref{Cdouble}(0.0)
    zeta1r = Ref{Cdouble}(0.0)
    zeta1i = Ref{Cdouble}(0.0)
    zeta2r = Ref{Cdouble}(0.0)
    zeta2i = Ref{Cdouble}(0.0)
    asumr = Ref{Cdouble}(0.0)
    asumi = Ref{Cdouble}(0.0)
    bsumr = Ref{Cdouble}(0.0)
    bsumi = Ref{Cdouble}(0.0)
    ccall((:zunhj_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(zr), Ref(zi), Ref(fnu), Ref(ipmtr), Ref(tol), phir, phii, argr, argi, zeta1r, zeta1i, zeta2r, zeta2i, asumr, asumi, bsumr, bsumi)
    return phir[], phii[], argr[], argi[], zeta1r[], zeta1i[], zeta2r[], zeta2i[], asumr[], asumi[], bsumr[], bsumi[]
end

function c_zuchk(yr::Float64, yi::Float64, nz::Int32, ascle::Float64, tol::Float64)
    nz_ref = Ref{Int32}(nz)
    ccall((:zuchk_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}),
        Ref(yr), Ref(yi), nz_ref, Ref(ascle), Ref(tol))
    return nz_ref[]
end

function c_zs1s2(zrr::Float64, zri::Float64, s1r::Float64, s1i::Float64, s2r::Float64, s2i::Float64, nz::Int32, ascle::Float64, alim::Float64, iuf::Int32)
    s1r_ref = Ref{Cdouble}(s1r)
    s1i_ref = Ref{Cdouble}(s1i)
    s2r_ref = Ref{Cdouble}(s2r)
    s2i_ref = Ref{Cdouble}(s2i)
    nz_ref = Ref{Int32}(nz)
    iuf_ref = Ref{Int32}(iuf)
    ccall((:zs1s2_, LIB), Cvoid,
        (Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}, Ref{Cdouble}, Ref{Cdouble}, Ref{Int32}),
        Ref(zrr), Ref(zri), s1r_ref, s1i_ref, s2r_ref, s2i_ref, nz_ref, Ref(ascle), Ref(alim), iuf_ref)
    return s1r_ref[], s1i_ref[], nz_ref[], iuf_ref[]
end

# ---------- shared grids ----------

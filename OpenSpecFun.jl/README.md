# OpenSpecFun.jl

Pure Julia implementations of OpenSpecFun special-function routines, aligned against the upstream Fortran/C reference behavior.

## Usage

```julia
using OpenSpecFun

# Faddeeva / error-function family
w = faddeeva_w(1.2 + 0.5im)
erfcx = faddeeva_erfcx(0.7 - 0.2im)

# AMOS low-level routines
val = zabs(3.0, -4.0)
yr, yi, nz, ierr = zbesi(0.8, 0.3, 0.5, 1, 3)
```

## Source Mapping

Public functions are traceable through `FUNCTION_SOURCE_MAP` in `src/OpenSpecFun.jl`.

## Faddeeva/Faddeeva.c

### faddeeva_w
Complex Faddeeva function.

```julia
faddeeva_w(0.5 + 1.0im)
```

### faddeeva_w_im
Imaginary part helper for real input.

```julia
faddeeva_w_im(0.5)
```

### faddeeva_erfcx
Scaled complementary error function for complex input.

```julia
faddeeva_erfcx(1.0 - 0.3im)
```

### faddeeva_erfcx_re
Real-input/output variant of `faddeeva_erfcx`.

```julia
faddeeva_erfcx_re(1.0)
```

### faddeeva_erf
Complex error function.

```julia
faddeeva_erf(0.8 + 0.2im)
```

### faddeeva_erf_re
Real-input/output variant of `faddeeva_erf`.

```julia
faddeeva_erf_re(0.8)
```

### faddeeva_erfi
Imaginary error function for complex input.

```julia
faddeeva_erfi(0.8 + 0.2im)
```

### faddeeva_erfi_re
Real-input/output variant of `faddeeva_erfi`.

```julia
faddeeva_erfi_re(0.8)
```

### faddeeva_erfc
Complex complementary error function.

```julia
faddeeva_erfc(0.8 + 0.2im)
```

### faddeeva_erfc_re
Real-input/output variant of `faddeeva_erfc`.

```julia
faddeeva_erfc_re(0.8)
```

### faddeeva_dawson
Complex Dawson integral.

```julia
faddeeva_dawson(0.8 + 0.2im)
```

### faddeeva_dawson_re
Real-input/output variant of `faddeeva_dawson`.

```julia
faddeeva_dawson_re(0.8)
```

## Faddeeva/Faddeeva.h

### Declared C API
The header declares the same Faddeeva entrypoints mirrored above. Julia users should call the `faddeeva_*` functions exported by this package.

```julia
# Julia wrapper usage stays the same for all C header entries
faddeeva_erfcx(0.5 + 0.1im)
```

## amos/d1mach.f

### d1mach
Double-precision machine constants.

```julia
d1mach(4)
```

## amos/dgamln.f

### dgamln
Natural log-gamma for real positive input.

```julia
dgamln(3.5)
```

## amos/i1mach.f

### i1mach
Integer machine constants.

```julia
i1mach(14)
```

## amos/xerror.f

### xerror
Compatibility error hook.

```julia
xerror("msg", 3, 1, 0)
```

## amos/zabs.f

### zabs
Complex magnitude from real/imag parts.

```julia
zabs(3.0, -4.0)
```

## amos/zacai.f

### zacai
Internal AMOS continuation helper.

```julia
zacai(0.7, 0.2, 0.5, 1, 1, 2, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zacon.f

### zacon
Internal AMOS continuation helper.

```julia
zacon(0.7, 0.2, 0.5, 1, 1, 2, 1.0, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zairy.f

### zairy
Airy Ai / derivative and scaled variants.

```julia
zairy(0.5, -0.2, 0, 1)
```

## amos/zasyi.f

### zasyi
Internal asymptotic I-Bessel helper.

```julia
zasyi(0.7, 0.2, 0.5, 1, 2, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zbesh.f

### zbesh
Hankel Bessel sequence.

```julia
zbesh(0.8, 0.2, 0.5, 1, 1, 3)
```

## amos/zbesi.f

### zbesi
Modified Bessel I sequence.

```julia
zbesi(0.8, 0.2, 0.5, 1, 3)
```

## amos/zbesj.f

### zbesj
Bessel J sequence.

```julia
zbesj(0.8, 0.2, 0.5, 1, 3)
```

## amos/zbesk.f

### zbesk
Modified Bessel K sequence.

```julia
zbesk(0.8, 0.2, 0.5, 1, 3)
```

## amos/zbesy.f

### zbesy
Bessel Y sequence.

```julia
zbesy(0.8, 0.2, 0.5, 1, 3)
```

## amos/zbinu.f

### zbinu
Internal I-Bessel backend entrypoint.

```julia
zbinu(0.8, 0.2, 0.5, 1, 3, 1.0, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zbiry.f

### zbiry
Airy Bi / derivative and scaled variants.

```julia
zbiry(0.5, -0.2, 0, 1)
```

## amos/zbknu.f

### zbknu
Internal K-Bessel backend entrypoint.

```julia
zbknu(0.8, 0.2, 0.5, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zbuni.f

### zbuni
Internal uniform I-Bessel backend.

```julia
zbuni(0.8, 0.2, 0.5, 1, 3, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zbunk.f

### zbunk
Internal uniform K-Bessel backend.

```julia
zbunk(0.8, 0.2, 0.5, 1, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zdiv.f

### zdiv
Complex division in AMOS style.

```julia
zdiv(1.0, 2.0, 0.5, -0.25)
```

## amos/zexp.f

### zexp
Complex exponential from real/imag inputs.

```julia
zexp(0.5, -0.2)
```

## amos/zkscl.f

### zkscl
Internal K-Bessel scaling helper.

```julia
zkscl(0.8, 0.2, 0.5, 3, 0.1, -0.2, 1.0, 1e-14, 700.0)
```

## amos/zlog.f

### zlog
AMOS complex logarithm helper.

```julia
zlog(0.8, -0.3)
```

## amos/zmlri.f

### zmlri
Internal Miller algorithm helper.

```julia
zmlri(0.8, 0.2, 0.5, 1, 3, 1e-14)
```

## amos/zmlt.f

### zmlt
Complex multiplication helper.

```julia
zmlt(1.0, 2.0, 0.5, -0.25)
```

## amos/zrati.f

### zrati
Internal ratio recursion helper.

```julia
zrati(0.8, 0.2, 0.5, 3, 1e-14)
```

## amos/zs1s2.f

### zs1s2
Internal continuation combiner.

```julia
zs1s2(0.7, -0.1, 0.5, 0.2, 0.1, -0.2, 0, 1.0, 700.0, 0)
```

## amos/zseri.f

### zseri
Internal I-Bessel series helper.

```julia
zseri(0.8, 0.2, 0.5, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zshch.f

### zshch
Complex hyperbolic sine/cosine helper.

```julia
zshch(0.8, -0.2)
```

## amos/zsqrt.f

### zsqrt
AMOS complex square-root helper.

```julia
zsqrt(0.8, -0.2)
```

## amos/zuchk.f

### zuchk
Underflow safety checker.

```julia
zuchk(0.1, 0.2, 0, 1.0, 1e-14)
```

## amos/zunhj.f

### zunhj
Uniform asymptotic parameter routine (J/Y/H families).

```julia
zunhj(0.8, 0.2, 1.3, 0, 1e-14)
```

## amos/zuni1.f

### zuni1
Internal uniform I-Bessel worker.

```julia
zuni1(0.8, 0.2, 0.5, 1, 3, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zuni2.f

### zuni2
Internal uniform I-Bessel worker.

```julia
zuni2(0.8, 0.2, 0.5, 1, 3, 1.0, 1e-14, 700.0, 680.0)
```

## amos/zunik.f

### zunik
Uniform asymptotic parameter routine (I/K families).

```julia
zunik(0.8, 0.2, 1.2, 1, 0, 1e-14, 0)
```

## amos/zunk1.f

### zunk1
Internal uniform K-Bessel worker.

```julia
zunk1(0.8, 0.2, 0.5, 1, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zunk2.f

### zunk2
Internal uniform K-Bessel worker.

```julia
zunk2(0.8, 0.2, 0.5, 1, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zuoik.f

### zuoik
Internal overflow/underflow guard for I/K sequences.

```julia
zuoik(0.8, 0.2, 0.5, 1, 1, 3, 1e-14, 700.0, 680.0)
```

## amos/zwrsk.f

### zwrsk
Internal Wronskian normalization helper.

```julia
zwrsk(0.8, 0.2, 0.5, 1, 3, 0.1, -0.2, 1e-14, 700.0, 680.0)
```

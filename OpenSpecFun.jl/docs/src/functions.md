# Function Reference

This page lists every public function in OpenSpecFun.jl, grouped by family.

## Faddeeva family

### Core complex form

```@docs
OpenSpecFun.faddeeva_w
OpenSpecFun.faddeeva_w_im
OpenSpecFun.faddeeva_erfcx
OpenSpecFun.faddeeva_erfcx_re
OpenSpecFun.faddeeva_erf
OpenSpecFun.faddeeva_erf_re
OpenSpecFun.faddeeva_erfi
OpenSpecFun.faddeeva_erfi_re
OpenSpecFun.faddeeva_erfc
OpenSpecFun.faddeeva_erfc_re
OpenSpecFun.faddeeva_dawson
OpenSpecFun.faddeeva_dawson_re
```

## Machine helpers and diagnostics

```@docs
OpenSpecFun.d1mach
OpenSpecFun.dgamln
OpenSpecFun.i1mach
OpenSpecFun.xerror
```

## Split-complex AMOS helpers

```@docs
OpenSpecFun.zabs
OpenSpecFun.zdiv
OpenSpecFun.zexp
OpenSpecFun.zlog
OpenSpecFun.zmlt
OpenSpecFun.zsqrt
OpenSpecFun.zshch
```

## AMOS Bessel and Airy sequences

```@docs
OpenSpecFun.zbesi
OpenSpecFun.zbesj
OpenSpecFun.zbesk
OpenSpecFun.zbesy
OpenSpecFun.zbesh
OpenSpecFun.zairy
OpenSpecFun.zbiry
```

## AMOS continuation and asymptotic workers

```@docs
OpenSpecFun.zbinu
OpenSpecFun.zbknu
OpenSpecFun.zmlri
OpenSpecFun.zseri
OpenSpecFun.zasyi
OpenSpecFun.zrati
OpenSpecFun.zwrsk
OpenSpecFun.zuni1
OpenSpecFun.zuni2
OpenSpecFun.zbuni
OpenSpecFun.zunk1
OpenSpecFun.zunk2
OpenSpecFun.zbunk
OpenSpecFun.zacon
OpenSpecFun.zacai
OpenSpecFun.zuoik
```

## Uniform asymptotic parameter routines

```@docs
OpenSpecFun.zunik
OpenSpecFun.zunhj
```

## Safety and scaling helpers

```@docs
OpenSpecFun.zuchk
OpenSpecFun.zkscl
OpenSpecFun.zs1s2
```

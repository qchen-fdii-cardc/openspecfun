# OpenSpecFun.jl

OpenSpecFun.jl provides pure Julia implementations of selected routines from the OpenSpecFun project, including the Faddeeva family and AMOS special-function helpers.

## Getting Started

```julia
using OpenSpecFun

faddeeva_w(0.5 + 1.0im)
zabs(3.0, -4.0)
```

## API Overview

The public API is grouped into two main families:

- Faddeeva routines for the complex error function, scaled variants, and real-valued convenience wrappers.
- AMOS routines for complex Bessel, Airy, and supporting numerical helpers.

The top-level module also exposes small utility functions such as `d1mach`, `dgamln`, `i1mach`, and `xerror`.

### Faddeeva family

Use these when you need the complex error function or closely related real-valued helpers.

```julia
faddeeva_erfcx(1.25 + 0.5im)
faddeeva_erf_re(0.75)
faddeeva_dawson(0.25 + 0.0im)
```

### AMOS family

These entry points expose the translated AMOS special-function routines.

```julia
zbesi(0.5, 0.25, 1.0, 1, 1)
zairy(0.25, -0.1, 0, 1)
zbesh(0.5, 0.25, 1.0, 1, 1, 1)
```

## Module

```@docs
OpenSpecFun
```

## API Reference

```@autodocs
Modules = [OpenSpecFun]
Order   = [:function, :type, :constant]
```

## Source Mapping

The package tracks provenance for each public entry point through `FUNCTION_SOURCE_MAP` in the source tree.

The mapping is useful when you need to jump from the Julia wrapper back to the original OpenSpecFun source file while reading the docs or comparing behavior.

# OpenSpecFun.jl

OpenSpecFun.jl provides pure Julia implementations of selected routines from the OpenSpecFun project, including the Faddeeva family and AMOS special-function helpers.

## Getting Started

```julia
using OpenSpecFun

faddeeva_w(0.5 + 1.0im)
zabs(3.0, -4.0)
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

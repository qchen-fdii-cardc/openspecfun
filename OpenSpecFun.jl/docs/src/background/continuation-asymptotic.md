# Continuation and asymptotic workers

## Background

`zacai`, `zacon`, `zbinu`, `zbknu`, `zmlri`, `zseri`, `zasyi`, `zrati`, `zuni1`, `zuni2`, `zbuni`, `zunk1`, `zunk2`, `zbunk`, and `zuoik` are the worker routines that carry the original AMOS branch structure.

## Math

The continuation core used by `zacai` is

```math
K(\nu, z e^{m\pi i}) = K(\nu, z)e^{-m\pi i\nu} - m\pi i\,I(\nu, z)
```

That relation is the prototype for the larger continuation and branch-selection logic across the family.

## Modifications and implementation

These routines are kept as explicit workers rather than being collapsed into a single generic dispatcher. That preserves the same region tests and numerical fallbacks as the Fortran source and makes the higher-level wrappers easier to audit against AMOS.

## Examples

```julia
using OpenSpecFun

# Used internally by the Bessel families when a branch continuation is needed.
```

## Charts

This family does not have direct charts; its effect is visible in the Bessel and Airy outputs.
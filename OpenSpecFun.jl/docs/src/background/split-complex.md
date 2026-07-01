# Split-complex helpers

## Background

`zabs`, `zdiv`, `zexp`, `zlog`, `zmlt`, `zsqrt`, and `zshch` are the split real/imaginary helper routines that let the AMOS translation preserve the original Fortran calling style.

## Math

The family exists to implement the primitive complex operations that the original code assembles by hand: magnitude, division, multiplication, exponential, principal-branch logarithm and square root, and hyperbolic sine/cosine pairing.

## Modifications and implementation

The Julia translation keeps these as small compatibility wrappers instead of replacing them with direct high-level complex arithmetic everywhere. That preserves the ABI expected by the larger recurrence and continuation routines.

## Examples

```julia
using OpenSpecFun

zabs(3.0, 4.0)
zdiv(1.0, 2.0, 3.0, 4.0)
zsqrt(1.0, -1.0)
```

## Charts

This family does not have a dedicated chart.
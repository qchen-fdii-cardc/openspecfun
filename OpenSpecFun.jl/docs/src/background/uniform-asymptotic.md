# Uniform asymptotic parameter routines

## Background

`zunik` and `zunhj` compute the asymptotic parameters used by the large-order Bessel approximations.

## Math

These routines build the phase, amplitude, and correction series that later feed the `I`, `J`, `Y`, and Hankel families when both order and argument are large.

## Modifications and implementation

The implementation follows the AMOS pattern: compute the asymptotic parameters once, then reuse them in the downstream sequence routines. That keeps the branch logic centralized and avoids duplicating the large-order expansion machinery.

## Examples

```julia
using OpenSpecFun

# Internal worker routines for the large-order asymptotic path.
```

## Charts

No dedicated charts are needed for these parameter builders.
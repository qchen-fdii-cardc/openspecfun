# Safety and scaling helpers

## Background

`zuchk`, `zkscl`, and `zs1s2` are the numerical safety helpers that keep the recurrence and continuation paths from drifting into underflow or unstable scaling.

## Math

- `zuchk` checks whether a complex term is too small relative to the active scaling threshold.
- `zkscl` rescales a `K`-sequence near the underflow limit.
- `zs1s2` combines the two continuation contributions used by the original AMOS logic.

## Modifications and implementation

These helpers are left visible in the translation because they capture the exact scaling decisions made by AMOS. Keeping them explicit makes it easier to verify that the higher-level wrappers still follow the original safety rules.

## Examples

```julia
using OpenSpecFun

# Internal helpers used by the scaled continuation paths.
```

## Charts

This family does not have a dedicated chart.
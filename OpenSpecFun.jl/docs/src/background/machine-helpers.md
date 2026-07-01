# Machine helpers

## Background

`d1mach`, `i1mach`, `dgamln`, and `xerror` are the AMOS compatibility helpers that make the translated routines behave like the original package.

## Math

These helpers are not end-user special functions. Their role is numerical bookkeeping: machine constants, log-gamma evaluation for positive real input, and the historical error-reporting entry point.

## Modifications and implementation

The Julia code keeps the original control-flow role of these routines instead of folding the logic into the higher-level callers. That keeps the branch thresholds, scaling decisions, and diagnostics aligned with the AMOS source.

## Examples

```julia
using OpenSpecFun

d1mach(1)
i1mach(9)
dgamln(5.0)
```

## Charts

No charts are needed here; the family is entirely control and threshold logic.
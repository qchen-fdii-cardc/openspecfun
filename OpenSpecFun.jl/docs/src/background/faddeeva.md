# Faddeeva family

## Background

The Faddeeva family is the complex error-function layer that underlies the exported `faddeeva_*` helpers. It ties the complex plane together through a single analytic core and then exposes the common real-valued projections that users usually want.

## Math

```math
w(z) = e^{-z^2}\,\operatorname{erfc}(-iz)
```

```math
\operatorname{erfcx}(z) = e^{z^2}\operatorname{erfc}(z),
\qquad
\operatorname{erf}(z) = 1 - \operatorname{erfc}(z),
\qquad
\operatorname{erfi}(z) = -i\,\operatorname{erf}(iz)
```

```math
F(x) = e^{-x^2}\int_0^x e^{t^2}\,dt = \frac{\sqrt{\pi}}{2} e^{-x^2} \operatorname{erfi}(x)
```

## Modifications and implementation

The Julia implementation keeps the provenance mapping back to [Faddeeva/Faddeeva.c](https://github.com/qchen-fdii-cardc/openspecfun/blob/main/Faddeeva/Faddeeva.c). The exported wrappers preserve the family split between the complex-valued core, the scaled complementary error function, and the real Dawson branch.

## Examples

```julia
using OpenSpecFun

faddeeva_w(1 + 2im)
faddeeva_erfcx(2.0)
faddeeva_dawson(0.5)
```

## Charts

There is no dedicated chart for this family yet. The closest visual reference is the Dawson curve used in the Bessel/Airy overview.
using Documenter
using OpenSpecFun

makedocs(
    sitename="OpenSpecFun.jl",
    modules=[OpenSpecFun],
    format=Documenter.HTML(
        prettyurls=false,
        canonical="",
    ),
    pages=[
        "Home" => "index.md",
        "Functions" => "functions.md",
        "Background" => [
            "background.md",
            "background/faddeeva.md",
            "background/machine-helpers.md",
            "background/split-complex.md",
            "background/bessel-airy.md",
            "background/continuation-asymptotic.md",
            "background/uniform-asymptotic.md",
            "background/safety-scaling.md",
        ],
    ],
    checkdocs=:exports,
)

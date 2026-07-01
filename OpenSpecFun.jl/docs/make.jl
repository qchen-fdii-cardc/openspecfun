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
        "Background" => "background.md",
    ],
    checkdocs=:exports,
)

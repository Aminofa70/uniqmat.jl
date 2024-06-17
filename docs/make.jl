using uniqmat
using Documenter

DocMeta.setdocmeta!(uniqmat, :DocTestSetup, :(using uniqmat); recursive=true)

makedocs(;
    modules=[uniqmat],
    authors="Aminofa70 <amin.alibakhshi@upm.es> and contributors",
    sitename="uniqmat.jl",
    format=Documenter.HTML(;
        canonical="https://Aminofa70.github.io/uniqmat.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Aminofa70/uniqmat.jl",
    devbranch="main",
)

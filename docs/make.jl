using Quaternions
using Documenter

DocMeta.setdocmeta!(Quaternions, :DocTestSetup, :(using Quaternions); recursive=true)

makedocs(;
    modules=[Quaternions],
    repo="https://github.com/JuliaGeometry/Quaternions.jl/blob/{commit}{path}#{line}",
    sitename="Quaternions.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaGeometry.github.io/Quaternions.jl",
        assets = ["assets/custom.css", "assets/favicon.ico"],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/JuliaGeometry/Quaternions.jl",
)

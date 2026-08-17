using Documenter, TestItemExamplePackage

makedocs(
    sitename = "TestItemExamplePackage.jl",
    modules = [TestItemExamplePackage],
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(
    repo = "github.com/julia-testitems/TestItemExamplePackage.jl.git",
    push_preview = true,
)

# TestItemExamplePackage.jl

[![CI](https://github.com/julia-testitems/TestItemExamplePackage.jl/actions/workflows/juliaci.yml/badge.svg?branch=main)](https://github.com/julia-testitems/TestItemExamplePackage.jl/actions/workflows/juliaci.yml)
[![codecov](https://codecov.io/gh/julia-testitems/TestItemExamplePackage.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/julia-testitems/TestItemExamplePackage.jl)
[![Docs (dev)](https://img.shields.io/badge/docs-dev-blue.svg)](https://julia-testitems.github.io/TestItemExamplePackage.jl/dev)

A tiny temperature-conversion package that exists to demonstrate a Julia package
fully on the [test item](https://julia-testitems.org) stack: `@testitem` tests in
`test/`, `Pkg.test` compatibility via TestItemRunner.jl, CI through the reusable
[testitem-workflow](https://github.com/julia-testitems/testitem-workflow), an
active format check (`JuliaFormat.toml`), and Documenter docs deployed by the same
workflow.

The step-by-step story of what was added to the bare package is told in the
[Example chapter](https://julia-testitems.org/guide/example) of the test item docs.

## Try it

```sh
juliati                                     # run all test items (needs TestItemApp.jl)
juliaformat --check .                       # the CI format gate, locally
julia --project -e 'using Pkg; Pkg.test()'  # the classic way still works
```

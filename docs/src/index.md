# TestItemExamplePackage.jl

A deliberately small Julia package whose only purpose is to show what a package
looks like once it uses the [test item framework](https://julia-testitems.org):
`@testitem` based tests, `Pkg.test` compatibility, the reusable
[testitem-workflow](https://github.com/julia-testitems/testitem-workflow) for CI,
a `JuliaFormat.toml`, and this Documenter site.

The step-by-step walkthrough of how the bare package was turned into this one is
in the [Example chapter](https://julia-testitems.org/guide/example) of the test
item docs.

## What the package does

It converts temperatures between `Celsius`, `Fahrenheit` and `Kelvin`:

```julia
using TestItemExamplePackage

to_fahrenheit(Celsius(100))    # Fahrenheit(212.0)
to_kelvin(Fahrenheit(32))      # Kelvin(273.15)
Celsius(100) ≈ Fahrenheit(212) # true
```

Constructing a temperature below absolute zero throws a `DomainError`.

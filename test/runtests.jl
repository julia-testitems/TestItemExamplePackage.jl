using TestItemRunner

@run_package_tests

# Not needed for discovery, but including the files means `Pkg.test` parses
# them and catches syntax errors early.
include("test_conversions.jl")
include("test_shared_module.jl")

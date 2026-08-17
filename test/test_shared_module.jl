# A test module is evaluated once per test process and shared by every test
# item that lists it in `setup`. Use it for fixtures that are expensive to build.
@testmodule Fixtures begin
    using TestItemExamplePackage

    const boiling = Celsius(100)
    const freezing = Celsius(0)

    # Pretend this table is expensive to compute.
    const table = Dict(c => to_fahrenheit(Celsius(c)) for c in -50:50)
end

@testitem "Fixture constants" setup = [Fixtures] begin
    @test to_fahrenheit(Fixtures.boiling).value ≈ 212
    @test to_kelvin(Fixtures.freezing).value ≈ 273.15
end

@testitem "Fixture table" setup = [Fixtures] begin
    @test length(Fixtures.table) == 101
    @test Fixtures.table[0].value ≈ 32
    @test Fixtures.table[-40].value ≈ -40
end

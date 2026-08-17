# A snippet is re-evaluated in every test item that lists it in `setup`.
@testsnippet SampleTemps begin
    # (celsius, fahrenheit, kelvin) triples with well-known values
    samples = [
        (0.0, 32.0, 273.15),
        (100.0, 212.0, 373.15),
        (-40.0, -40.0, 233.15),
        (37.0, 98.6, 310.15),
    ]
end

@testitem "Celsius to Fahrenheit" setup = [SampleTemps] tags = [:fast] begin
    for (c, f, _) in samples
        @test to_fahrenheit(Celsius(c)).value ≈ f
    end
end

@testitem "Fahrenheit to Celsius" setup = [SampleTemps] tags = [:fast] begin
    for (c, f, _) in samples
        @test to_celsius(Fahrenheit(f)).value ≈ c
    end
end

@testitem "Kelvin round trips" setup = [SampleTemps] tags = [:fast] begin
    for (c, f, k) in samples
        @test to_kelvin(Celsius(c)).value ≈ k
        @test to_kelvin(Fahrenheit(f)).value ≈ k
        @test to_celsius(Kelvin(k)).value ≈ c
        @test to_fahrenheit(Kelvin(k)).value ≈ f
    end
end

@testitem "Cross-scale comparison" tags = [:fast] begin
    @test Celsius(100) ≈ Fahrenheit(212)
    @test Kelvin(0) ≈ Celsius(-273.15)
    @test !(Celsius(0) ≈ Fahrenheit(0))
end

@testitem "Below absolute zero is rejected" tags = [:fast] begin
    @test_throws DomainError Celsius(-300)
    @test_throws DomainError Fahrenheit(-500)
    @test_throws DomainError Kelvin(-1)
    @test Kelvin(0).value == 0.0
end

@testitem "Round trip over a large range" tags = [:slow] begin
    for c in -273.15:0.01:1000.0
        t = Celsius(c)
        @test to_celsius(to_fahrenheit(t)).value ≈ c atol = 1.0e-9
        @test to_celsius(to_kelvin(t)).value ≈ c atol = 1.0e-9
    end
end

@testitem "Greeting" begin
    @test greet() == "Hello World!"
end

# `skip` takes an arbitrary expression that is evaluated in the test process,
# so it answers for the Julia version that would actually run the test item.
@testitem "Uses a Julia 1.11 feature" skip = (VERSION < v"1.11") begin
    @test length(Memory{Float64}(undef, 3)) == 3
end

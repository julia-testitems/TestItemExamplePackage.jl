module TestItemExamplePackage

export Temperature, Celsius, Fahrenheit, Kelvin
export to_celsius, to_fahrenheit, to_kelvin, greet

"""
    Temperature

Abstract supertype of all temperature scales.
"""
abstract type Temperature end

"""
    Celsius(value)

A temperature on the Celsius scale. Values below absolute zero (`-273.15`) throw a
`DomainError`.
"""
struct Celsius <: Temperature
    value::Float64
    function Celsius(value::Real)
        value < -273.15 && throw(DomainError(value, "below absolute zero"))
        return new(value)
    end
end

"""
    Fahrenheit(value)

A temperature on the Fahrenheit scale. Values below absolute zero (`-459.67`) throw a
`DomainError`.
"""
struct Fahrenheit <: Temperature
    value::Float64
    function Fahrenheit(value::Real)
        value < -459.67 && throw(DomainError(value, "below absolute zero"))
        return new(value)
    end
end

"""
    Kelvin(value)

A temperature on the Kelvin scale. Negative values throw a `DomainError`.
"""
struct Kelvin <: Temperature
    value::Float64
    function Kelvin(value::Real)
        value < 0 && throw(DomainError(value, "below absolute zero"))
        return new(value)
    end
end

"""
    to_kelvin(t::Temperature) -> Kelvin

Convert any temperature to Kelvin.
"""
to_kelvin(t::Kelvin) = t
to_kelvin(t::Celsius) = Kelvin(t.value + 273.15)
to_kelvin(t::Fahrenheit) = Kelvin((t.value - 32) * 5 / 9 + 273.15)

"""
    to_celsius(t::Temperature) -> Celsius

Convert any temperature to Celsius.
"""
to_celsius(t::Celsius) = t
to_celsius(t::Temperature) = Celsius(to_kelvin(t).value - 273.15)

"""
    to_fahrenheit(t::Temperature) -> Fahrenheit

Convert any temperature to Fahrenheit.
"""
to_fahrenheit(t::Fahrenheit) = t
to_fahrenheit(t::Temperature) = Fahrenheit((to_kelvin(t).value - 273.15) * 9 / 5 + 32)

Base.isapprox(a::Temperature, b::Temperature; kwargs...) =
    isapprox(to_kelvin(a).value, to_kelvin(b).value; kwargs...)

"""
    greet() -> String

Return a friendly greeting.
"""
greet() = "Hello World!"

end # module TestItemExamplePackage

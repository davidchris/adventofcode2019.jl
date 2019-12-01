using Printf

modulemasses = readlines("./AdventOfCode2019/december01/december01Input.txt")

modulemasses = map(x -> parse(Int64, x), modulemasses)

# Part One

# Fuel required to launch a given module is based on its mass.
# Specifically, to find the fuel required for a module, take its mass,
# divide by three, round down, and subtract 2.

function masstofuel(mass)
    return floor(mass / 3) - 2
end

sum([masstofuel(x) for x in modulemasses])

@printf "%.0f" sum([masstofuel(x) for x in modulemasses])

# Part Two

# What is the sum of the fuel requirements for all of the modules on your
# spacecraft when also taking into account the mass of the added fuel?
# (Calculate the fuel requirements for each module separately, then add them
# all up at the end.)

function fuelrequired(mass)
    fuel = masstofuel(mass)
    if fuel <= 0
        return 0
    else
        return fuel + fuelrequired(fuel)
end
end

sum([fuelrequired(x) for x in modulemasses])

@printf "%.0f" sum([fuelrequired(x) for x in modulemasses])

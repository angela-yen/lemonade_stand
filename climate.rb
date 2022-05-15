# Climate: works out how hot the day is based on the last one

# Needs a starting value
# Generates a new random number that is based on a range within the previous value
# Way to store the values or overwrite the temp from the previous day

# keep track - pass as an argument to the day/life cycle

class Climate
    attr_accessor :temperatures

    def initialize
        @temperatures = [25]
    end

    def temperature_generator
        new_temp = temperatures.last + rand(-4...4)
        temperatures.push(new_temp)
        return new_temp
    end

end

# today = Climate.new
# puts today.temperature_generator
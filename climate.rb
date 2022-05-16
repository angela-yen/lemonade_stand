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

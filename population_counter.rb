# PopulationCounter: works out how many people walk past
# Number of people who walk past the stand is calculated based on temp

# This needs to be able to require the information given from the climate in order to calculate how many walk pass

# Rule: there will be half the amount of people as the temperature that arrive at the stand and puchase - need to find a way to round odd numbers

class PopulationCounter
    attr_accessor :climate

    def initialize climate
        @climate = climate
    end

    def calculator
      (climate.temperature_generator * 0.5).round
    end
end


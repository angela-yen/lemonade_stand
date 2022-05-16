class PopulationCounter
    attr_accessor :climate

    def initialize climate
        @climate = climate
    end

    def calculator
      (climate.temperature_generator * 0.5).round
    end
end


require_relative 'day'
require_relative 'climate'
require_relative 'population_counter'
require_relative 'market'
require_relative 'inventory'

class LifeCycle
    attr_accessor :inventory, :climate, :population, :market, :days

    def initialize
        @inventory = Inventory.new
        @climate = Climate.new
        @population = PopulationCounter.new(@climate)
        @market = Market.new
        @days = []
    end

    def next_day
        today = Day.new(
            @inventory,
            @market,
            @climate.temperature_generator,
            @population.calculator
        )
        today.process!
        @days.push(today)
    end

    def has_funds?
        @inventory.my_inventory[:balance] >= 0
    end
end


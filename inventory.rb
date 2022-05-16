class Inventory
    attr_accessor :my_inventory

    def initialize
      @my_inventory = {
        balance: 5,
        lemons: 0,
        sugar: 0,
        lemonade_made: 0
      }
    end

    def show_inventory
      puts "💰Balance: $#{my_inventory[:balance].round(2)}, 🍋Lemons: #{my_inventory[:lemons]}, 🍬Sugar: #{my_inventory[:sugar]}, 🥤Lemonade Made: #{my_inventory[:lemonade_made]}"
    end

    def add(type, amount)
      raise Exception.new('Invalid type') unless my_inventory.keys.include?(type)
      @my_inventory[type] += amount
    end

    def remove(type, amount)
      raise Exception.new('Invalid type') unless my_inventory.keys.include?(type)
      @my_inventory[type] -= amount
    end

end



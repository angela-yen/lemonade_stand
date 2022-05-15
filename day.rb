class Day
    attr_accessor :inventory, :current_temperature, :current_population, :market

    def initialize inventory, market, current_temperature, current_population
        @inventory = inventory
        @market = market
        @current_temperature = current_temperature
        @current_population = current_population
    end

    def about_today
        puts "Today's temperature is #{current_temperature}. Today's lemon price is $#{market.price_of_lemon}/lemon and sugar price is $#{market.price_of_sugar}/sugar"
        puts "Here is your inventory:"
        inventory.show_inventory
    end

    def purchase_lemon
        puts "How many lemons would you like to buy?"
        @number_of_lemons = gets.chomp.to_i
    end

    def lemon_cost(number_of_lemons)
        cost_of_lemons = @number_of_lemons * market.price_of_lemon
        return cost_of_lemons
    end

    def add_lemon(number_of_lemons)
      inventory.add(:lemons, number_of_lemons)
    end 

    def purchase_sugar
        puts "How many sugars would you like to buy?"
        cost_of_sugars = @number_of_sugars = gets.chomp.to_i
        return cost_of_sugars
    end

    def sugar_cost(number_of_sugars)
        @number_of_sugars * market.price_of_sugar
    end

    def add_sugar(number_of_sugars)
      inventory.add(:sugars, number_of_sugars)
    end

    def total_cost(cost_of_lemons, cost_of_sugars)
      cost_of_lemons + cost_of_sugars.round(2)

      # raise Exception.new('Not enough money!') unless cost_of_lemons + cost_of_sugars < inventory.my_inventory[:balance]

      # cost_of_lemons + cost_of_sugars.round(2)
      
    end

    def check_cost_with_balance(total_cost)
      loop do 
        puts "Not enough money, try again"
        purchase_lemon
        purchase_sugar
        unless inventory.my_inventory[:balance] - total_cost > 0
          break
        end
      end
    end 

    def make_lemonade
      puts "How many cups of lemonade would you like to make?"
        number_of_cups = gets.chomp.to_i

        # raise Exception.new('Error not enough lemons or sugars') unless number_of_cups.to_i <= inventory.my_inventory[:lemons] && inventory.my_inventory[:sugars]

        # number_of_cups

    end

    def money_made_today(number_of_cups)
        cups_sold = [current_population, number_of_cups].min
        money_today = cups_sold * 2
        return money_today.round(2)
    end

    def profit(money_today, total_today)
        money_today - total_today
    end

    def summary(total_today, money_today, today_profit)
        puts "Your total cost of purchase is $#{total_today.round(2)}"
        puts "Your money made today is $#{money_today.round(2)}"
        puts "Your total profit for today is $#{today_profit.round(2)}"
    end

    def process!
      puts about_today

      number_of_lemons = purchase_lemon
      cost_of_lemons = lemon_cost(@number_of_lemons)
    
      number_of_sugars = purchase_sugar
      cost_of_sugars = sugar_cost(number_of_sugars)
      today_cost = total_cost(cost_of_lemons, cost_of_sugars).to_f.round(2)
      
      total_cost = today_cost
      
      check_cost_with_balance(total_cost)
      
      # loop do
      #     if today_cost < inventory.my_inventory[:balance] 
      #       puts "Not enough money!, try again"
      #       break
      #     end
      #   end
      
      add_lemon(number_of_lemons)
      add_sugar(number_of_sugars)
   
     
      # loop do
      #     number_of_cups = make_lemonade
      #     puts "Not enough lemons and/or sugars! Try again"
      #     puts inventory.show_inventory
      #     number_of_cups

      #     if number_of_cups > (inventory.my_inventory[:lemons] + purchase_lemon) && (inventory.my_inventory[:sugars] + purchase_sugar)
      #     break
      #   end
      # end 
      
      number_of_cups = make_lemonade
      
      inventory.remove(:balance, today_cost.round)
      inventory.remove(:lemons, number_of_cups)
      inventory.remove(:sugars, number_of_cups)

      inventory.add(:lemonade_made, number_of_cups)

      money_made_today = money_made_today(number_of_cups)
      inventory.add(:balance, money_made_today)

      profit_today = profit(money_made_today, today_cost)

      summary = summary(today_cost, money_made_today, profit_today)
      puts summary
    end
end


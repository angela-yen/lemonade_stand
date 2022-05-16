class Day
    attr_accessor :inventory, :current_temperature, :current_population, :market

    def initialize inventory, market, current_temperature, current_population
        @inventory = inventory
        @market = market
        @current_temperature = current_temperature
        @current_population = current_population
    end

    def about_today
        puts "Today's temperature is 🌡  #{current_temperature}. Today's lemon price is $#{market.price_of_lemon}/🍋 and sugar price is $#{market.price_of_sugar}/🍬"
        puts "Here is your inventory:"
        inventory.show_inventory
    end

    def purchase_lemon
        puts "How many lemons would you like to buy? 🍋"
        @number_of_lemons = gets.chomp.to_i
    end

    def lemon_cost(number_of_lemons)
        @number_of_lemons * market.price_of_lemon
    end

    def add_lemon(number_of_lemons)
      inventory.add(:lemons, @number_of_lemons)
    end 

    def purchase_sugar
        puts "How much sugar would you like to buy? 🍬"
        @number_of_sugar = gets.chomp.to_i
    end

    def sugar_cost(number_of_sugar)
        @number_of_sugar * market.price_of_sugar
    end

    def add_sugar(number_of_sugar)
      inventory.add(:sugar, @number_of_sugar)
    end

    def total_cost(cost_of_lemons, cost_of_sugar)
      total = cost_of_lemons + cost_of_sugar.round(2)
    end

    def how_many_lemonades
      puts "How many cups of lemonade would you like to make? 🥤"
        @number_of_cups = gets.chomp.to_i
    end

    def make_lemonade(how_many_lemonades)

      raise Exception.new('Oh no! Not enough lemons 🍋 or sugar 🍬, try again!') unless how_many_lemonades <= inventory.my_inventory[:lemons] && inventory.my_inventory[:sugar]

    end

    def money_made_today(make_lemonade)
        cups_sold = [current_population, make_lemonade].min
        money_today = cups_sold * 2
        return money_today.round(2)
    end

    def profit(money_today, total_today)
        money_today - total_today
    end

    def summary(total_today, money_today, today_profit)
        puts "Your total cost of purchase is $#{total_today.round(2)} 💸"
        puts "Your money made today is $#{money_today.round(2)} 💰"
        puts "Your total profit for today is $#{today_profit.round(2)} 🤑"
    end

    def process!
      puts about_today
    
      number_of_lemons = purchase_lemon
      cost_of_lemons = lemon_cost(number_of_lemons)
    
      number_of_sugar = purchase_sugar
      cost_of_sugar = sugar_cost(number_of_sugar)

      today_cost = total_cost(cost_of_lemons, cost_of_sugar)
      
      add_lemon(number_of_lemons)
      add_sugar(number_of_sugar)

      number_of_cups = nil
      loop do
        begin
          number_of_cups = make_lemonade(how_many_lemonades)
          break
        rescue Exception => exception
          puts exception.message
        end 
      end

      inventory.remove(:lemons, @number_of_cups)
      inventory.remove(:sugar, @number_of_cups)
      inventory.remove(:balance, today_cost)

      inventory.add(:lemonade_made, @number_of_cups)

      money_made_today = money_made_today(@number_of_cups)
      inventory.add(:balance, money_made_today)

      profit_today = profit(money_made_today, today_cost)

      summary = summary(today_cost, money_made_today, profit_today)
      puts summary
    end
end


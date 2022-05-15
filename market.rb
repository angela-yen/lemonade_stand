# Market: calculates lemon + sugar prices

# require how many lemons and sugar the user wants to purchase today.


class Market

    def price_of_lemon
        rand(0.25...0.5).round(2)
    end

    def price_of_sugar
        rand(0.02...0.05).round(2)
    end

end

# market = Market.new
# puts market.price_of_lemon
# puts market.price_of_sugar


# new price can be generated each day and be sent to 'day' to calculate the price of each lemonade
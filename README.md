Lemonade Stand

Make and sell lemonade in order to turn a profit!

Any version of ruby you want to use (might as well use the latest version).
Don’t use any gems except for rspec for testing.
That’s it!
How the game works:
This is how one ‘day’ of the game will play out. The game goes on for infinite days or until the player runs out of funds. You are free to decide how some of the rules should be implemented (eg. how temperature translates to number of people on the street)

Beginning of day:
Buy lemons (variable price, 25-50 cents each)
Buy sugar  (variable price, 2-5 cents 'each')
You need 1 lemon and 1 sugar to make a cup of lemonade
Make some cups of lemonade (user determines how many)
Set a price for your lemonade

Day plays out:
Temperature is selected by the game (should be related to previous day's temp)
Number of people who walk past the stand is calculated based on temp
Number of cups sold calculated based on number of people + price
Any cups of lemonade not sold are thrown away

End of day:
Show the players profit/loss

Notes:
You start the game with $5, 0 lemons, 0 sugar, and 0 cups of lemonade
Your supply of empty cups is infinite
Recommended classes:
This is just an idea of a class structure you could use.

Inventory: holds lemon + sugar inventory + $ balance + lemonade made
Day: simulates the day
Lifecycle: holds multiple days
PopulationCounter: works out how many people walk past
Climate: works out how hot the day is based on the last one
Market: calculates lemon + sugar prices
Extensions - DO NOT WORK ON UN

To start the app run `ruby lemonade_stand.rb`
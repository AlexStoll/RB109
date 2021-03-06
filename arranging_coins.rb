# total of n coins
# return the number of complete staircase rows that
# can be made

#arrange_coins(15) #= 5

# *
# * *
# * * *
# * * * *
# * * * * *

#arrange_coins(14) #= 4

# *
# * *
# * * *
# * * * *    # last complete row
# * * * *



# Algorithm
# Build the rows
# loop with a counter
# first row is 1, second is 2, third is 3
# subtract the size of that row from the coin_pile
# return current_row if coin_pile <= 0

def arrange_coins(n)
  coin_pile = n
  current_row = 1

  loop do
    coin_pile -= current_row
    if coin_pile == 0
      return current_row
    elsif coin_pile < 0
      return current_row - 1
    end
    current_row += 1
  end
end

# *
# * *
# * * *
# * * * *
# * * * * *

p arrange_coins(15) == 5
p arrange_coins(8) == 3
p arrange_coins(200) == 19
p arrange_coins(131) == 15


# Asks the user for its name
puts "Welcome to the Dice Game. What's your name?:\n"
player = gets.chomp.capitalize

# Basic instructions
puts "\nHere's how the Dice Game works:\n
You can play as many rounds as you want.
Each round is made out of 3 rolls and you can choose the amount of dice to throw per roll."

puts "\nSo, #{player}..."

results = []
rands = []
# Each round consists of 3 rolls, hence 3 is getting hard-coded
3.times do |roll_set|
  # User gets asked how many dice it's gonna use for each throw.
  puts "\nHow many dice would you like to throw on roll ##{roll_set + 1}? (Use a number greater than 0):"
  dice = gets.chomp.to_i

  # It has to be greater than 0, if it is not it'll show an error
  if dice < 1
    puts "\n\e[31mRemember to use a number greater than 0. Try again...\e[0m"
    redo
  end

  string = 'Rolling a'
  # User gets asked how many sides will each die have
  dice.times do |die|
    puts "\nHow many sides should die #{die + 1} have? (Use a number greater than 1):"
    sides = gets.chomp.to_i

    # It has to be greater than 1, if it is not it'll show an error
    if sides < 2
      puts "\n\e[31mRemember to use a number greater than 1. Try again...\e[0m"
      redo
    end

    # According to how many dice there are it sets a string or
    # substring that will show in the results later on
    if dice > 1
      total = dice
      throw = die + 1
      string.concat(" #{sides}-sided dice") if throw < total && throw == 1
      string.concat(", a #{sides}-sided dice") if throw > 1 && throw < total
      string.concat(" and a #{sides}-sided dice") if throw == total
      rands << rand(1..sides)

      results << "##{roll_set + 1}: #{string}, you got a #{rands[-dice..-1].join(', ')}." if throw == total
    else
      rands << rand(1..sides)
      results << "##{roll_set + 1}: Rolling a #{sides}-sided dice, you got a #{rands[-1]}."
    end
  end
end

total = rands.sum

# After the roll set loop ends it returns the result.
# Showing each throw on their own, with their own results
# and also the overall amount
puts "\n\e[32mResults:\e[0m"
results.each do |result|
  puts "\n\e[32m#{result}\e[0m"
end
puts "\n\e[32mYou got #{total} in total, #{player}!!\e[0m"

puts "\n\nIf you want to play again, just rerun the program..."

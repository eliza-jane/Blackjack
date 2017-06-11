require_relative "hand"
require_relative "deck"
require_relative "card"

player = Hand.new
dealer = Hand.new

deck = Deck.new

player.cards << deck.deal
player.cards.flatten!

puts "Player was dealt #{player.cards.last.name}"

player.cards << deck.deal
player.cards.flatten!

puts "Player was dealt #{player.cards.last.name}"

puts "Player's current score is: #{player.calc_score}"

loop do
  print "Do you wish to hit or stay? (h/s) >"
  input = gets.chomp.downcase

  unless input == 'h' || input == 's'
    print "That's not a valid input. Please input 'h' or 's'."
    input = gets.chomp.downcase
  end

  if
    player.cards << deck.deal
    player.cards.flatten!
    puts "Player was dealt #{player.cards.last.name}"
    puts "Player's current score is: #{player.calc_score}"
    break puts 'Player busted!' if player.calc_score > 21

  else
    puts "Player's current score is: #{player.calc_score}"
    loop do
      dealer.cards << deck.deal
      dealer.cards.flatten!
      puts "Dealer was dealt #{dealer.cards.last.name}"
      puts "Dealer's current score is: #{dealer.calc_score}"
      if dealer.calc_score >= 17 && dealer.calc_score <= 21
        break
      elsif dealer.calc_score > 21
        break puts 'Dealer busted!'
      end
    end
    break
  end
end

if dealer.calc_score <= 21 && dealer.calc_score > player.calc_score
  puts "Dealer wins!"
elsif player.calc_score <= 21 && dealer.calc_score < player.calc_score
  puts "Player wins!"
end




def hit_or_stay?
  print "Do you wish to hit or stay? (h/s) >"
  input = gets.chomp.downcase

  unless input == 'h' || input == 's'
    print "That's not a valid input. Please input 'h' or 's'>"
    input = gets.chomp.downcase
  end

  if input == 'h'
    @input = true
  else
    @input = false
  end
end

require_relative "hand"
require_relative "deck"
require_relative "card"

class Blackjack
  attr_reader :deck, :player, :dealer, :input

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new
  end

  def play_game
    hit(@player, 2)
    player_turn
    dealer_turn
    self.winner
  end

  def hit(player, num = 1)
    num.times do
      player.cards << deck.deal
      player.cards.flatten!
      if player == @player
        puts "Player was dealt #{player.cards.last.name}"
        puts "Player's current score is: #{player.calc_score}"
      else
        puts "Dealer was dealt #{player.cards.last.name}"
        puts "Dealer's current score is: #{player.calc_score}"
      end
    end
  end


  def player_turn
    if @player.calc_score > 21
      puts "Player busted!"
      return
    end

    print "\nDo you wish to hit or stay? (h/s) >"
    input = gets.chomp.downcase

    if input == 'h'
      self.hit(@player)
      self.player_turn
    elsif input == 's'
      puts "Player's final score is: #{player.calc_score}"
      puts "Thanks for playing; now it's the dealer's turn!"
      return
    else
      print "That's not a valid input. Please input 'h' or 's'."
      self.player_turn
    end
  end

  def dealer_turn
    self.hit(@dealer)
    if @dealer.calc_score >= 17 && dealer.calc_score <= 21
      puts "Dealer's score is #{@dealer.calc_score}"
      return
    elsif @dealer.calc_score > 21
      puts 'Dealer busted!'
      return
    else
      self.dealer_turn
    end
  end

  def winner
    if @dealer.calc_score <= 21 && @dealer.calc_score > @player.calc_score
      puts "Dealer wins!"
      return
    elsif @player.calc_score <= 21 && @player.calc_score > @dealer.calc_score
      puts "Player wins!"
      return
    end
  end

end

#do you want to play a game? ;)
blackjack = Blackjack.new
blackjack.play_game

require_relative "card"

class Deck

  SUITS = ['♠', '♥', '♣', '♦']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  #deal out cards into an array and test to see if that array is unique
  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
  end

  def build_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end

#assume that it deals one card at a time, unless
#otherwise specified
  def deal(num = 1)
    return @cards.pop(num)
  end
end

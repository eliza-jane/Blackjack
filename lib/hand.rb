
require_relative 'deck'

class Hand

  attr_reader :cards

  def initialize (cards = [])
    @cards = cards
  end

  def calc_score
    score = 0
    ace_count = 0

    @cards.each do |card|
      if card.type_of == 'number'
        score += card.value
      elsif card.type_of == 'face'
        score += 10
      elsif card.type_of == 'ace'
        ace_count += 1
      end
    end

#to handle the ace's finicky qualities--make a different method
    if ace_count > 0 && score + 11 + (ace_count - 1) <= 21
      score += 11 + (ace_count - 1)
    else
      score += 1 * ace_count
    end

    return score

  end

end

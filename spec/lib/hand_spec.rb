require_relative '../../lib/deck'
require_relative '../../lib/card'
require "spec_helper"

RSpec.describe Hand do
  let(:hand){ Hand.new([Card.new('J', '♠'), Card.new(3, '♠')]) }
  let(:deck){ Deck.new }

  describe '#initialize' do
    it 'should return an empty hand before cards are dealt' do
      empty_hand = Hand.new
      expect(empty_hand.cards).to eq([])
    end
  end

  describe '#calc_score' do
  #extra hands for testing calc_score
    let(:ace_hand) { Hand.new([Card.new('A', '♠'), Card.new('J', '♠')]) }
    let(:big_ace_hand) { Hand.new([Card.new('A', '♠'), Card.new('J', '♠'), Card.new(5, '♠')]) }
    let(:bigger_ace_hand) { Hand.new([Card.new('A', '♠'), Card.new('J', '♠'), Card.new('A', '♥')]) }

    it 'gives the sum of a given hand' do
      expect(hand.calc_score).to eq(13)
      expect(ace_hand.calc_score).to eq(21)
      expect(big_ace_hand.calc_score).to eq(16)
      expect(bigger_ace_hand.calc_score).to eq(12)
    end

  end

end

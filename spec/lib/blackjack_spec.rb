require 'spec_helper'

RSpec.describe Blackjack do
  let(:game){ Blackjack.new }

  describe '#initialize' do
    it 'creates a new instance of Blackjack' do
      expect(game).to be_an_instance_of(Blackjack)
    end
  end

  describe '#hit' do
    it 'returns the number of cards you wish to be dealt to you' do
      game.hit(game.player, 2)
      expect(game.player.cards.size).to be(2)
    end
  end

  describe '#dealer_turn' do
    it 'keeps dealing until dealer hits 17' do
      game.dealer_turn
      expect(game.dealer.calc_score).to be <(30)
    end
  end

  describe '#winner' do
    it 'returns the person with the appropriate score' do
      game.hit(game.player)
      game.hit(game.dealer, 2)
      expect{game.winner}.to output("Dealer wins!\n").to_stdout
    end
  end

end

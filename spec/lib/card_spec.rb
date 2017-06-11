require 'spec_helper'

RSpec.describe Card do
  let(:card){ Card.new('A', '♠') }
  let(:card2){ Card.new(3, '♠') }
  let(:card3){ Card.new('K', '♠') }
  describe '#initialize' do
    it 'should have a value and suit once initialized' do
      expect(card.value).to eq('A')
      expect(card.suit).to eq('♠')
    end
  end

  describe '#type_of' do
    it 'should return the card\'s type' do
      expect(card.type_of).to eq('ace')
      expect(card2.type_of).to eq('number')
      expect(card3.type_of).to eq('face')
    end
  end

  describe '#name' do
    it 'should return a stringified name of the card' do
      expect(card.name).to eq("A♠")
    end
  end
end

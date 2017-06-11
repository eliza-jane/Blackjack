require "spec_helper"

RSpec.describe Deck do
  let(:deck){ Deck.new }

  describe '#initialize and #build_deck' do
    it 'should create a deck of unique cards when initialized' do
      expect(deck.cards.uniq.size).to eq(52)
      expect(deck.cards.size).to eq(52)
    end

    it 'should create unique decks upon initialization' do
      new_deck = Deck.new

      deck_array = []
      deck.cards.each do |card|
        deck_array << card
      end

      new_deck_array = []
      new_deck.cards.each do |card|
        new_deck_array << card
      end

      expect(deck_array == new_deck_array).to be_falsey
    end
  end


  describe '#deal' do
    it 'should decrease the number in the deck after dealing' do
      deck.deal
      expect(deck.cards.size).to eq(51)
      deck.deal(3)
      expect(deck.cards.size).to eq(48)
    end

    it 'should be taking cards from the top of the deck' do
      top_of_deck = deck.cards[-1]
      #ask why we need the brackets here...syntax thing?
      expect(deck.deal).to eq([top_of_deck])
    end
  end
end

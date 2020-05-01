require "deck.rb"

describe "Deck" do
    subject(:deck) { Deck.new }

    describe "#initialize" do
        it "should create a proper 52 card deck" do
            expect(deck.stack.size).to eq(52)
        end

        it "should create 13 cards of each suit, ranging from 1 to 13" do
            suit = deck.stack.select { |card| card.color == :red }
            expect(suit.size).to eq(13)
            values = suit.map { |card| card.value }.sort
            expect(values).to eq((1..13).to_a)
        end
    end

    describe "#deck shuffle" do
    
      it "should randomize the deck" do 
        new_arr = deck.stack.dup
        expect(deck.deck_shuffle).to_not eq(new_arr)  
      end
    end
end
require "card.rb"

describe "Card" do
    subject(:card) { Card.new(6, :red) }
    describe "#initialize" do
        it "should instantiate a card with a value" do
            expect(card.value).to eq(6)
        end
        it "should instantiate a card with a color" do
            expect(card.color).to be(:red)
        end
    end
end
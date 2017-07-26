require "spec_helper"

RSpec.describe Card do
  let(:card) {Card.new('♠', 10)}

  describe ".new" do
    it "takes a suit and a rank as arguments" do

      expect(card).to be_a(Card)
    end
  end

  describe "@suit" do
    it "makes sure we can read the contents of suit and rank" do

      expect(card.suit).to eq('♠')
      expect(card.rank).to eq(10)
    end
  end
end

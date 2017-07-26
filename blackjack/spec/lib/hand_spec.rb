require "spec_helper"

RSpec.describe Hand do
  # '♦', '♣', '♠', '♥'
  let(:hand) { Hand.new("Steven") }
  let(:card1) { Card.new("♥","A") }
  let(:card2) { Card.new("♥",'K') }
  let(:card3) { Card.new("♥",5) }
  let(:card4) { Card.new("♥",6) }
  let(:card5) { Card.new("♠","A") }

  describe "#calculate_hand " do
    it "checks that card and card2 calculates correctly" do

      hand.cards << card1
      hand.cards << card2
      hand.cards << card3
      expect(hand.calculate_hand).to eq(16)
    end

    it "checks that card2 and card3 calculates correctly" do

      hand.cards << card2
      hand.cards << card3
      expect(hand.calculate_hand).to eq(15)
    end

    it "checks that card3 and card4 calculates correctly" do

      hand.cards << card3
      hand.cards << card4
      expect(hand.calculate_hand).to eq(11)
    end

    it "checks that card4 and card5 calculates correctly" do

      hand.cards << card4
      hand.cards << card5
      expect(hand.calculate_hand).to eq(17)
    end
  end

end

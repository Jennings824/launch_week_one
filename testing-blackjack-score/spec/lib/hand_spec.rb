require "spec_helper"

describe Hand do
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new("♦",10), Card.new("♥","J")]) }
  let(:hand2) { Hand.new([Card.new("♥","A"), Card.new("♦","A")]) }
  let(:hand3) { Hand.new([Card.new("♥","A"), Card.new("♦","A"), Card.new("♠","A"), Card.new("♣","A")]) }
  let(:hand4) { Hand.new([Card.new("♦",10), Card.new("♥",7), Card.new("♣",2)]) }
  let(:blackjack1) { Hand.new([Card.new("♦",10), Card.new("♥",7), Card.new("♣",2), Card.new("♠",2)]) }
  let(:blackjack2) { Hand.new([Card.new("♥","A"), Card.new("♦","K")]) }
  let(:bust) { Hand.new([Card.new("♥",10), Card.new("♦",5), Card.new("♦","K")]) }

  describe "#calculate_hand" do
    it "should calculate :hand as 21" do
      expect(hand.calculate_hand).to eq(20)
    end
    it "should calculate :hand2 as 12" do
      expect(hand2.calculate_hand).to eq 12
    end
    it "should calculate :hand3 as 14" do
      expect(hand3.calculate_hand).to eq 14
    end
    it "should calculate :hand4 as 14" do
      expect(hand4.calculate_hand).to eq 19
    end
    it "should calculate :blackjack1 as 21" do
      expect(blackjack1.calculate_hand).to eq 21
    end
    it "should calculate :blackjack2 as 21" do
      expect(blackjack2.calculate_hand).to eq 21
    end
    it "should calculate :bust as 25 and a bust!!" do
      expect(bust.calculate_hand).to eq 25
    end

    it "each hand should not equal the number provided" do
      expect(hand.calculate_hand).to_not eq 19
      expect(hand2.calculate_hand).to_not eq 6
      expect(hand3.calculate_hand).to_not eq 31
      expect(hand4.calculate_hand).to_not eq 27
      expect(blackjack1.calculate_hand).to_not eq 8
      expect(blackjack2.calculate_hand).to_not eq 12
      expect(bust.calculate_hand).to_not eq 14
    end
  end
end

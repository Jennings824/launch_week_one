require_relative 'deck'

class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    # Your code here after writing tests
    # Think about what this method needs to do
    score = 0
    aces = 0

    @cards.each do |card|
      if card.rank == 'J' || card.rank == 'Q' || card.rank == 'K'
        score += 10
      elsif card.rank == 'A'
        score +=11
        aces += 1
      else
        score += card.rank
      end
    end

    while (aces > 0) && (score > 21)
      score -= 10
      aces -=1
    end
    score
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)

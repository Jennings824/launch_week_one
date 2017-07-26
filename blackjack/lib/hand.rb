require_relative 'deck'

class Hand
  attr_accessor :player_name, :cards
  def initialize(player_name)
    @player_name = player_name
    @cards = []
  end

  def calculate_hand
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

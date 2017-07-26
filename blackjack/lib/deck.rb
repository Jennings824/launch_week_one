require_relative 'card'

class Deck
  attr_accessor :cards
  SUITS = ['♥︎', '♣', '♠︎', '♦']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |rank|
        cards << Card.new(suit, rank)
      end
    end
    cards.shuffle
  end

  def deal
    @cards.pop
  end
end

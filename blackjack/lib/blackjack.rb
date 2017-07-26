require_relative "card"
require_relative "deck"
require_relative "hand"

class Blackjack
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Hand.new("Player1")
    @dealer = Hand.new("Dealer")
  end

  def start_blackjack
    puts "Welcome to Blackjack!"
    deal_cards
    show_cards_dealt(@player)
    score_total(@player)
    players_turn
    show_cards_dealt(@dealer)
    score_total(@dealer)
    dealers_turn
    winner
  end

  def deal_cards
    2.times do
    @player.cards << @deck.deal
    @dealer.cards << @deck.deal
    end
  end

  def show_cards_dealt(name)
    name.cards.each do |card|
      puts "#{name.player_name} was dealt #{card.rank} #{card.suit}"
    end
  end

  def score_total(name)
    puts "#{name.player_name} Score: #{name.calculate_hand}"
    if name.calculate_hand > 21
      puts "Bust!"
      if dealer.player_name == "Dealer"
        puts "You win!"
      end
    end
  end

  def players_turn
     while hit_or_stand?
       new_card = @deck.deal
       puts "Player was dealt #{new_card.rank} #{new_card.suit}"
       @player.cards << new_card
       score_total(@player)
      end
   end

   def dealers_turn
     while @dealer.calculate_hand < 17
       new_card = @deck.deal
       puts "#{dealer.player_name} was dealt #{new_card.rank} #{new_card.suit}"
       @dealer.cards << new_card
       score_total(@dealer)
      end
   end

   def winner
     if @player.calculate_hand > @dealer.calculate_hand
       puts "#{player.player_name} wins!"
     elsif
       @player.calculate_hand == @dealer.calculate_hand
       puts "Push! no winner"
     else
       puts "You lose!"
     end
   end

   def hit_or_stand?
     puts "Hit or stand (H/S):"
     input = gets.chomp.downcase
     while (input != "h" && input != "s") do
       puts "You must either Hit or Stay (H/S)"
       input = gets.chomp.downcase
     end

     if input == "h"
      true
     else input == "s"
      false
      end
   end
end


play = Blackjack.new
play.start_blackjack

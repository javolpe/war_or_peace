class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = Array.new
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      :basic
    elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && player1.deck.cards[2].rank == player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      :war
    end
  end

  def winner
    if type == :basic && player1.deck.cards[0].rank > player2.deck.cards[0].rank
      player1.name
    elsif type == :basic && player1.deck.cards[0].rank < player2.deck.cards[0].rank
      player2.name
    elsif type == :war && player1.deck.cards[2].rank > player2.deck.cards[2].rank
      player1.name
    elsif type == :war && player1.deck.cards[2].rank < player2.deck.cards[2].rank
      player2.name
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0..2]
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    turn_winner = winner
    pile_cards
    if turn_winner == player1.name
      player1.deck.cards << spoils_of_war
      player1.deck.cards = player1.deck.cards.flatten
    else
      player2.deck.cards << spoils_of_war
      player2.deck.cards = player2.deck.cards.flatten
    end
    @spoils_of_war = []
  end
require 'pry'; binding.pry
end

class Turn
  attr_accessor :the_loser

  attr_reader :player1,
              :player2,
              :spoils_of_war



  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = Array.new
    @the_loser = ""
  end

  def type
    if player1.deck.cards[0].rank == player2.deck.cards[0].rank && player1.deck.cards[2].nil?
         @the_loser = player1.name
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank && player2.deck.cards[2].nil?
        @the_loser = player2.name
    elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && (player1.deck.cards[2].rank == player2.deck.cards[2].rank)
      :mutually_assured_destruction
    elsif player1.deck.cards.first.rank == player2.deck.cards.first.rank
      :war
    elsif player1.deck.cards[0].rank != player2.deck.cards[0].rank
      :basic
    end
  end

  def winner
    if type == :basic && (player1.deck.cards.first.rank > player2.deck.cards.first.rank)
          player1.name
    elsif type == :basic && (player1.deck.cards.first.rank < player2.deck.cards.first.rank)
         player2.name
    elsif type == :war && (player1.deck.cards[2].rank > player2.deck.cards[2].rank)
        player1.name
    elsif type == :war && (player1.deck.cards[2].rank < player2.deck.cards[2].rank)
         player2.name
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.first
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards.first
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << player2.deck.cards[0..2]
      @spoils_of_war << player1.deck.cards[0..2]
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    elsif type == :mutually_assured_destruction
      3.times do
        player2.deck.remove_card
        player1.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    turn_winner = winner
    pile_cards
    if turn_winner == player1.name
      player1.deck.cards << spoils_of_war
      player1.deck.cards = player1.deck.cards.flatten

    elsif turn_winner == player2.name
      player2.deck.cards << spoils_of_war
      player2.deck.cards = player2.deck.cards.flatten

    end
    @spoils_of_war = []
  end

end

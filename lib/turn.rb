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
    if self.player1.deck.cards[0].rank != self.player2.deck.cards[0].rank
      :basic
    elsif (self.player1.deck.cards[0].rank == self.player2.deck.cards[0].rank) && self.player1.deck.cards[2].rank == self.player2.deck.cards[2].rank
      :mutually_assured_destruction
    elsif self.player1.deck.cards[0].rank == self.player2.deck.cards[0].rank
      :war
    end
  end

  def winner
    if self.type == :basic && self.player1.deck.cards[0].rank > self.player2.deck.cards[0].rank
      self.player1
    elsif self.type == :basic && self.player1.deck.cards[0].rank < self.player2.deck.cards[0].rank
      self.player2
    elsif self.type == :war && self.player1.deck.cards[2].rank > self.player2.deck.cards[2].rank
      self.player1
    elsif self.type == :war && self.player1.deck.cards[2].rank < self.player2.deck.cards[2].rank
      self.player2
    else
      "No Winner"
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player2.deck.cards[0]
    elsif self.type == :war
      @spoils_of_war << player1.deck.cards[0]
      @spoils_of_war << player1.deck.cards[1]
      @spoils_of_war << player1.deck.cards[2]
#tried this and it didn't work  @spoils_of_war << player1.deck.cards[0..2]
      @spoils_of_war << player2.deck.cards[0]
      @spoils_of_war << player2.deck.cards[1]
      @spoils_of_war << player2.deck.cards[2]
    else
      3.times do
        self.player1.deck.remove_card
        self.player2.deck.remove_card
      end
    end
  end


end

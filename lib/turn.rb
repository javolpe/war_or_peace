class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
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

end

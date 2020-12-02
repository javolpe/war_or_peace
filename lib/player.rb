class Player
  attr_reader :name,
              :deck


  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost(player1, player2)
    if player1.deck.cards[0].rank > player2.deck.cards[0].rank
      return false
    else return true
    end
  end

end

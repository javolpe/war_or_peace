class Player
  attr_reader :name,
              :deck


  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards[0].nil?
      true
    elsif deck.cards[0].nil? == false
      false
    end
  end

end

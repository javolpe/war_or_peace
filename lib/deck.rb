class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index_position)
    cards[index_position].rank
  end

  def high_ranking_cards()
    array = []
    cards.each do |card|
      if card.rank > 10
        array.push(card)
      end
    end
    array
  end

  def percent_high_ranking()
    array = []
    cards.each do |card|
      if card.rank > 10
        array.push(card)
      end
    end
    percent = array.length.to_f/cards.length.to_f
    (percent * 100).round(2)
  end

  def remove_card()
    cards.delete_at(0)
  end

  def add_card(new_card)
    cards.push(new_card)
  end

end

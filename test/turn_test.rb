require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class TurnTest < Minitest::Test

  def test_turn_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Amos', deck)


    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Amos', deck)

    assert_equal turn.player1.name, 'Clarissa'
    assert_equal turn.spoils_of_war, []
  end


end

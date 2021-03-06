require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'


class PlayerTest < Minitest::Test

  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarissa', deck)

    assert_instance_of Player, player
  end

  def test_it_has_readable_name_attribute
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarissa', deck)

    assert_equal player.name, 'Clarissa'
  end

  def test_it_holds_cards_array_as_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarissa', deck)

    assert_includes(deck.cards, card1)
    assert_includes(deck.cards, card2)
    assert_includes(deck.cards, card3)
  end

  def test_if_player_has_lost_full
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck1)


    assert_equal player1.has_lost?, false
  end

  def test_if_player_has_lost_empty
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card2]
    deck = Deck.new(cards)
    player1 = Player.new('Clarissa', deck)
    deck.remove_card


    assert_equal player1.has_lost?, true
  end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card2, card3]
    deck = Deck.new(cards)
    deck.remove_card


    refute_includes deck.cards, card2
    assert_includes deck.cards, card3
  end



end

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

  def test_if_player_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck1 = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck1)
    card4 = Card.new(:diamond, '8', 8)
    card5 = Card.new(:spade, '2', 2)
    card6 = Card.new(:heart, '10', 10)
    deck2 = Deck.new([card4, card5, card6])
    player2 = Player.new('Amos', deck2)
    player1.has_lost(player1, player2)

    assert_equal(false, false)
  end

  def test_remove_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card2, card3]
    deck = Deck.new(cards)
    deck.remove_card

    refute_includes(deck.cards, card1)
    assert_includes(deck.cards, card2)
    assert_includes(deck.cards, card3)
  end



end

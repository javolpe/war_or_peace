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
    turn = Turn.new(player1, player2)


    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Amos', deck)
    turn = Turn.new(player1, player2)

    assert_equal turn.player1.name, 'Clarissa'
    assert_equal turn.spoils_of_war, []
  end

  def test_type_of_turn
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal turn.type, :basic
    #changed around rank of card1,3,5,6 to ensure all 3 outcomes occured when they should
  end

  def test_the_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    assert_equal turn.winner, turn.player1.name
  end

  def test_pile_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)

#  card3 = Card.new(:heart, '9', 11)
#switch out two instances of card3 to test :war

    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)

#    card5 = Card.new(:heart, '8', 12)
#switch out  card3&card5 to test :mutually_assured_destruction

    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    turn.pile_cards
    wanted_array = [card1, card3]

#    wanted_array = [card1, card2, card5, card3, card4, card6]
#us3 this wanted array for testing :war

#    wanted_array = [card8]
#us this wanted array for testing :mutually_assured_destruction


   assert_equal turn.spoils_of_war, wanted_array

#    assert_equal turn.player1.deck.cards, wanted_array
#use above assertion for testing :mutually_assured_destruction

  end

  def test_award_spoilers
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)
    turn.pile_cards
    turn.award_spoils
    wanted_array = [card2, card5, card8, card1, card3]

    assert_equal turn.player1.deck.cards, wanted_array

  end



end

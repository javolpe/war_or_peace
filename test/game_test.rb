require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'


class GameTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player1 = Player.new('Clarissa', deck)
    player2 = Player.new('Amos', deck)
    turn = Turn.new(player1, player2)
    new_game = Game.new(turn)

    assert_instance_of Game, new_game
  end

  def test_each_player_has_26_cards
    var1 = make_deck.shuffle
    var2=var1[0..25]
    var3=var1[26..51]

    deck1 = Deck.new(var2)
    deck2 = Deck.new(var3)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    new_game = Game.new(turn)

    assert_equal turn.player1.deck.cards.length, 26
    assert_equal turn.player2.deck.cards.length, 26
  end



end

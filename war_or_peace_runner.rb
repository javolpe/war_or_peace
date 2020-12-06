require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

var1 = make_deck.shuffle
var2=var1[0..25]
var3=var1[26..51]

deck1 = Deck.new(var2)
deck2 = Deck.new(var3)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

new_game = Game.new(turn)



p new_game.turn.player1.deck.cards.length

new_game.intro

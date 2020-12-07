require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'



var1 = make_deck.shuffle

var2=var1[0..25]
var3=var1[26..51]

var2.length
var3.length

deck1 = Deck.new(var2)
deck2 = Deck.new(var3)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)

new_game = Game.new(turn)

new_game.intro


# There is a bug that occurs where infinitely Megan and Aurora take turns each winning 2 cards on to infinity
# That bug lead me to finding some smaller bugs but I could not find the pattern that lead to that specific bug
# Sometimes it occurs early around turn 500, other times I've seen it occur as late as turn 1,700 & 2,200
# Looking forward to feedback on what went wrong in my code
# Found a few other bugs too and can't seem to track them down

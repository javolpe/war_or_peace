require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


def make_deck
    full_deck = []
    suits = [:club, :heart, :spade, :diamond]
    rank = (2..14).to_a

    suits.map do |suit|
      rank.map do |x|
        if x > 1 && x < 11
          full_deck << Card.new(suit, "#{x}", x)
        elsif x == 11
          full_deck << Card.new(suit, "Jack", x)
        elsif x == 12
          full_deck << Card.new(suit, "Queen", x)
        elsif x == 13
          full_deck << Card.new(suit, "King", x)
        elsif x == 14
          full_deck << Card.new(suit, "Ace", x)
        end
      end
    end
    deck = full_deck
end




class Game
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def intro
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    phrase = gets.chomp

    if phrase != "GO"
      intro
    else
      start
    end
  end

  def start
    i =0
    while i < 5001
      i+=1

# if i == 200
#   require 'pry';binding.pry
# end

      type = turn.type
      determine_winner = turn.winner
      turn.award_spoils(determine_winner)


        if turn.player1.has_lost? == true || turn.the_loser == turn.player1.name
          p "*~*~*~* Aurora has won the game! *~*~*~*"
          break
        elsif turn.player2.has_lost? == true || turn.the_loser == turn.player2.name
          p "*~*~*~* Megan has won the game! *~*~*~*"
          break
        end


        if determine_winner == turn.player1.name && type == :basic
            p "Turn#{i}: #{turn.player1.name} has won 2 Cards"
        elsif determine_winner == turn.player2.name && type == :basic
            p "Turn#{i}: #{turn.player2.name} has won 2 Cards"
        elsif determine_winner == turn.player1.name && type == :war
            p "Turn#{i}: WAR - #{turn.player1.name} has won 6 Cards"
        elsif determine_winner == turn.player2.name && type == :war
                p "Turn#{i}: WAR - #{turn.player2.name} has won 6 Cards"
        else p "Turn#{i}: *mutually assured destruction* 6 cards removed from play"
        end











      if i == 5000
        return p "---- DRAW ----"
      end

    end
  end
end

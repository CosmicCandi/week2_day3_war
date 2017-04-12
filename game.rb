require_relative 'deck.rb'
require_relative 'card.rb'
require 'tty'
require 'pry'

# Deliverables
### Explorer Mode ###
# A github repo containing (at least) five files: deck.rb, card.rb, deck_test.rb,
# card_test.rb, and game.rb
# Ties are discarded.
# When I run ruby game.rb on the command line, the script will run a simulated
# game and output the results as such: Player 1 won this game after 123 rounds and
# survived 23 WARs. Would you like a rematch (y/n)?
# Notes: A round is one card played by each player. A rematch should kick off
# another simulated game. Otherwise, the program exits with a
#"Thanks for playing" message.

# The game is won by the player who has the most cards captured once both players
# have exhausted their initial decks.
class Game

  attr_accessor :player1,
                :player2,
                :player1_winnings,
                :player2_winnings,
                :prompt,
                :rounds,
                :ties

  def initialize
    @player1 = Deck.new
    @player2 = Deck.new
    @player1_winnings = []
    @player2_winnings = []
    @prompt = TTY::Prompt.new
    @rounds = 0
    @ties = 0
    end

  def new_game
    play
  end

  def rematch
    play_again = prompt.yes?("Would you like a rematch?")
    if play_again
        Game.new.new_game
    else
      quitting_is_for_quitters
    end
  end

  def play
    until @player1.cards.empty?
      draw_and_show
    end
    end_game
  end

  def draw_and_show
    @rounds +=1
    p1_current_card = player1.draw_a_card
    p2_current_card = player2.draw_a_card
    if p1_current_card > p2_current_card
      @player1_winnings << p1_current_card
      @player1_winnings << p2_current_card
    elsif p2_current_card > p1_current_card
      @player2_winnings << p1_current_card
      @player2_winnings << p2_current_card
    else
     @ties += 1
    end
  end

  def end_game
    if @player1_winnings.length > @player2_winnings.length
      puts "Player One won after #{@rounds} rounds and survived #{@ties} wars!"
    elsif @player2_winnings.length > @player1_winnings.length
      puts "Player Two won after #{@rounds} rounds and survived #{@ties} wars!"
    else
      puts "We tied after #{@rounds} rounds and #{@ties} WARS!"
    end
    rematch
  end

  def quitting_is_for_quitters
    puts "War may be hell, but we were just getting started! Come back soon!"
  end

end

Game.new.new_game

### Adventure Mode ###
# When your deck is empty, you take all the cards you won, shuffle them, and that becomes your new deck.
# You win the game when your opponent is out of cards.
# In the event of a tie, each player draws one card and the highest wins all the cards in the pot. If there is another tie, all cards in the pot are discarded.
# No methods of more than 10 lines.
# Your adventure Mode game should be a separate file from your Explorer Mode game.

### Epic Mode ###
# A war now involves each player laying down four cards and then comparing the fifth. The higher card wins the entire pot. If there is still a tie, you go through this again - until there is a winner. Keep in mind: You might need to reshuffle your winnings if a player runs out of cards while doing this.
# Your Epic Mode game should be in a separate file from your adventure and explorer mode games.
# A test file (with tests for each method) for each our of game modes.

### Legendary Mode ###
# Keep score and statistics (how many rounds, how many wars) across rematches
# Test that if a game is played 10000 times, the results are 50/50 within the standard deviation of 50.
# When the user decides they don't want a rematch, stamp out a results table to the command line that displays those statistics. Ideally, a table with the stats from each game as well as cumulative statistics.

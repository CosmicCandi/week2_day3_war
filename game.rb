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
                :p1_current_card,
                :p2_current_card,
                :player1_winnings,
                :player2_winnings,
                :discard,
                :rounds,
                :ties

  def initialize
    @player1 = Deck.new
    @player2 = Deck.new
    @p1_current_card = p1_current_card
    @p2_current_card = p2_current_card
    @player1_winnings = []
    @player2_winnings = []
    @discard = []
    @rounds = 0
    @war_counter = 0

    new_game

  end

  def new_game
    prompt = TTY::Prompt.new
    prompt.yes?("Would you like to play a game of war?")
    if prompt
        play
    else
      quitting_is_for_quitters
    end
  end

  def play
    draw_and_show
  end

  def draw_and_show
    self.p1_current_card = []
    self.p2_current_card = []
    puts @p1_current_card << player1.draw_a_card
    puts @p2_current_card << player2.draw_a_card
    compare_cards
  end

  def total_hands(player)
    hand_total = player.map(&:value).reduce(:+)
  end

  def compare_cards
     "Debugging"
    puts "Player 1's Current Card"
    puts p1_current_card.inspect
    puts "Player 2's Current Card"
    puts p2_current_card.inspect
   if total_hands(p1_current_card) > total_hands(p2_current_card)    # Player 1's card is greater
     player1_winnings << p1_current_card   # Collect both cards for Player 1
     player1_winnings << p2_current_card
     @rounds += 1
     draw_and_show
   elsif total_hands(p2_current_card) > total_hands(p1_current_card) # Player 2's card is greater
     player2_winnings << p1_current_card   # Collect both cards for Player 2
     player2_winnings << p2_current_card
     @rounds +=1
     draw_and_show
   else                                    # Tie Condition
     discard << p1_current_card            # Discard both cards
     discard << p2_current_card
     @rounds +=1
     @war_counter += 1
     draw_and_show
   end
  end

  def end_game
    until player1.length < 1 || player2.length < 1 do
      puts "Player x won this game after x rounds and survived #{war_counter} wars!"
    end
  end


  def quitting_is_for_quitters
    puts "War may be hell, but we were just getting started! Come back soon!"
  end

end

Game.new

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

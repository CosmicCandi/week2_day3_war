# Deliverables
### Explorer Mode ###
# A github repo containing (at least) five files: deck.rb, card.rb, deck_test.rb, card_test.rb, and game.rb
# The game is won by the player who has the most cards captured once both players have exhausted their initial decks.
# Ties are discarded.
# When I run ruby game.rb on the command line, the script will run a simulated game and output the results as such: Player 1 won this game after 123 rounds and survived 23 WARs. Would you like a rematch (y/n)?
# Notes: A round is one card played by each player. A rematch should kick off another simulated game. Otherwise, the program exits with a
#"Thanks for playing" message.
# Your card and deck classes should be tested for the following:


# Adventure Mode
# When your deck is empty, you take all the cards you won, shuffle them, and that becomes your new deck.
# You win the game when your opponent is out of cards.
# In the event of a tie, each player draws one card and the highest wins all the cards in the pot. If there is another tie, all cards in the pot are discarded.
# No methods of more than 10 lines.
# Your adventure Mode game should be a separate file from your Explorer Mode game.
# Epic Mode
# A war now involves each player laying down four cards and then comparing the fifth. The higher card wins the entire pot. If there is still a tie, you go through this again - until there is a winner. Keep in mind: You might need to reshuffle your winnings if a player runs out of cards while doing this.
# Your Epic Mode game should be in a separate file from your adventure and explorer mode games.
# A test file (with tests for each method) for each our of game modes.
# Legendary Mode
# Keep score and statistics (how many rounds, how many wars) across rematches
# Test that if a game is played 10000 times, the results are 50/50 within the standard deviation of 50.
# When the user decides they don't want a rematch, stamp out a results table to the command line that displays those statistics. Ideally, a table with the stats from each game as well as cumulative statistics.

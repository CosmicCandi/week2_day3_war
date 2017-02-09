require 'minitest/autorun'
require './card.rb'
require './deck.rb'
require 'pry'

class Deck_Test < MiniTest::Test

  def setup
  end

  # A deck has 52 cards
  def test_a_deck_has_52_cards
    deck = Deck.new
    assert deck.cards.length == 52
  end

  # A deck contains 13 of each suit
  #Unable to get this functionality working.
  def test_a_deck_contains_13_of_each_suit
    #  deck = Deck.new
    #  test_array = []
    #  test_array << deck.suit.inspect
    #  binding.pry

  end

  # A deck contains four of each face of cards
  def test_a_deck_contains_four_of_each_face_of_cards
  end

  # A deck is shuffled on creation
  def test_a_deck_is_shuffled_on_creation
  end

  # A deck can be drawn, and once a card is drawn, the deck has one less card in it
  def test_a_card_can_be_drawn_and_no_longer_resides_in_the_deck
  end

end

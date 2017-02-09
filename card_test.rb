require 'minitest/autorun'
require './card.rb'

class Card_Test < MiniTest::Test

  # A Card has a suit, face and value
  def test_card_has_a_suit
    card = Card.new("Clubs", "King", 13)
    assert card.suit != nil
  end

  def test_card_has_a_face
    has_face = Card.new("Hearts", "Ace", 14)
    assert has_face.face != nil
  end

  def test_card_has_a_value
    has_value = Card.new("Hearts", "Ace", 14)
    refute has_value == nil
  end


  # An Ace has a value of 14
  def test_a_card_has_a_value
    ace = Card.new("Hearts", "Ace", 14)
    assert ace.face == "Ace"
    assert ace.value == 14
    # A King has a value of 13
    king = Card.new("Spades", "King", 13)
    assert king.face == "King"
    assert king.value == 13
    # A Queen has a value of 12
    queen = Card.new("Clubs", "Queen", 12)
    assert queen.face == "Queen"
    assert queen.value == 12
    # A Jack has a value of 11
    jack = Card.new("Diamonds", "Jack", 11)
    assert jack.face == "Jack"
    assert jack.value == 11

  end

  # Cards can be directly compared using > and <
  def test_two_cards_can_be_directly_compared
    card1 = Card.new("Hearts", 3, 3)
    card2 = Card.new("Diamonds", 4, 4)
    card3 = Card.new("Clubs", "Ace", 14)
    card4 = Card.new("Spades", 10, 10)

    assert card1.value < card2.value
    assert card2.value > card1.value
    assert card3.value > card4.value
    assert card4.value > card1.value
  end

end

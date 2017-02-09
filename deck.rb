require './card.rb'


class Deck

  attr_accessor :cards, :suit, :face, :value

  def initialize
    deck_building
    shuffle_up_and_deal
    @suit = suit
    @face = face
    @value = value

  end

  def deck_building
    suits = ["Clubs", "Hearts", "Diamonds", "Spades"]
    faces = (2..10).to_a + %w(Jack Queen King Ace)
    value = value

    self.cards = []
    suits.each do |suit|
      faces.each do |face|
        cards << Card.new(suit, face, faces.index(face) + 2)
      end
    end

  end

  def shuffle_up_and_deal
    cards.shuffle!
  end

  def draw_a_card
    cards.shift
  end





end

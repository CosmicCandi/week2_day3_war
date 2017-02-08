class Card

  attr_accessor :suit, :face, :value

  def initialize(suit, face, value )
    self.suit = suit
    self.face = face
    self.value = value
  end

end

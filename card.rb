class Card

  include Comparable

  attr_accessor :suit, :face, :value

  def initialize(suit, face, value )
    self.suit = suit
    self.face = face
    self.value = value
  end

  def <=>(other)
    if other.is_a? Card
      value <=> other.value
    else
      super(other)
    end
  end
  
end

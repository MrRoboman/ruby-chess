class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(color, pos = nil, board = nil)
    @color = color
    @pos = pos || [0,0] #TODO DELETE THIS DEFAULT
    @board = board
  end

  def x
    pos[0]
  end

  def y
    pos[1]
  end

  def empty?
    false
  end

  def to_s
    " #{symbol} "
  end

  def inspect
    "#{self.class}#{color}"
  end

end

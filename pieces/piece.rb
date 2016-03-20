class Piece
  attr_accessor :pos

  def initialize(color, pos = nil, board = nil)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    " #{symbol} "
  end
end

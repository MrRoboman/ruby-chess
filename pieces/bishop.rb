class Bishop < Piece
  include Slidable

  def initialize(color, pos = nil, board = nil)
    super
  end

  def deltas
    DIAGONAL
  end

  def symbol
    "♝".colorize(@color)
  end
end

class Queen < Piece
  include Slidable

  def initialize(color, pos = nil, board = nil)
    super
  end

  def deltas
    ORTHOGONAL + DIAGONAL
  end

  def symbol
    "♛".colorize(@color)
  end
end

class Knight < Piece
  include Steppable

  DELTAS = [
    [-2, 1], [-1, 2], [1, 2], [2, 1],
    [-2,-1], [-1,-2], [1,-2], [2,-1]
  ]

  def initialize(color, pos = nil, board = nil)
    super
  end

  def deltas
    DELTAS
  end

  def symbol
    "♞".colorize(@color)
  end
end

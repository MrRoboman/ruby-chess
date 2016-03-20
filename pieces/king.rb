class King < Piece
  include Steppable

  DELTAS = [
    [-1,-1], [0,-1], [1,-1],
    [-1, 0],         [1, 0],
    [-1, 1], [0, 1], [1, 1]
  ]

  def initialize(color, pos = nil, board = nil)
    super
  end

  def deltas
    DELTAS
  end

  def symbol
    "♚".colorize(@color)
  end
end

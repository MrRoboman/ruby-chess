class Rook < Piece
  include Slidable

  def initialize(color, pos = nil, board = nil)
    super
  end

  def deltas
    DELTAS
  end

  def symbol
    "♜".colorize(@color)
  end
end

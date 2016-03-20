class Knight < Piece

  def initialize(color, pos = nil, board = nil)
    super
  end

  def symbol
    "♞".colorize(@color)
  end
end

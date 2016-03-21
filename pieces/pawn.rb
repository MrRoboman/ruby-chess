class Pawn < Piece
  include Steppable

  def initialize(color, pos = nil, board = nil)
    super
    @home_pos = pos
  end

  def deltas
    dlts = []
    if color == :white
      dlts << [-1, 0]
      dlts << [-2, 0] if home?
    else
      dlts << [1, 0]
      dlts << [2, 0] if home?
    end
    dlts
  end

  def home?
    @pos == @home_pos
  end

  def symbol
    "♟".colorize(@color)
  end
end

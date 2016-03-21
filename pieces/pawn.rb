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
      dlts << [-1,-1] if opponent?([-1,-1])
      dlts << [-1, 1] if opponent?([-1, 1])
      dlts << [-2, 0] if home?
    else
      dlts << [1, 0]
      dlts << [1,-1] if opponent?([1,-1])
      dlts << [1, 1] if opponent?([1, 1])
      dlts << [2, 0] if home?
    end
    dlts
  end

  def opponent?(delta)
    x, y = @pos
    dx, dy = delta
    @board.opponent?([x+dx, y+dy], color)
  end

  def home?
    @pos == @home_pos
  end

  def symbol
    "♟".colorize(@color)
  end
end

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

  def valid_moves
    valid_moves!.reject do |pos|
      ghost_board = Board.new(@board)
      ghost_board.move(@pos, pos)
      ghost_board.check?(color)
      # false
    end
  end

end

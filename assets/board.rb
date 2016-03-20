class Board
  def self.build_grid
    Array.new(8) { Array.new(8) { NullPiece.instance} }
  end

  def initialize
    @grid = Board.build_grid
  end

  def rows
    @grid
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end
end

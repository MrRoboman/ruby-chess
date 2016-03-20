class Board
  def self.build_grid
    Array.new(8) { Array.new(8) { NullPiece.instance} }
  end

  def initialize
    grid = Board.build_grid
  end
end

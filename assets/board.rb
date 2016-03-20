class Board
  def self.build_board
    Array.new(8) { Array.new(8) { NullPiece.instance} }
  end
end

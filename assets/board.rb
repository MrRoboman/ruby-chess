require 'byebug'

class Board
  def self.build_grid
    Array.new(8) { Array.new(8) { NullPiece.instance} }
  end

  def initialize
    @grid = Board.build_grid
    setup
    # @grid[6][0] = Pawn.new(:white, [6, 0], self)
    # self[[1,0]] = Rook.new(:black, [1, 0], self)
    # self[[1,2]] = Rook.new(:black, [1, 2], self)
    # self[[5,2]] = Knight.new(:white, [5, 2], self)
  end

  def setup
    royal = [Rook, Bishop, Knight, King, Queen, Knight, Bishop, Rook]

    royal.each_with_index { |type, idx| make_piece(type, [0, idx], :black) }
    8.times { |i| make_piece(Pawn, [1, i], :black) }

    8.times { |i| make_piece(Pawn, [6, i], :white) }
    royal.each_with_index { |type, idx| make_piece(type, [7, idx], :white) }

  end

  def make_piece(type, pos, color)
    self[pos] = type.new(color, pos, self)
  end

  def rows
    @grid
  end

  def move(from_pos, to_pos)
    piece = self[from_pos]
    self[from_pos] = NullPiece.instance

    piece.pos = to_pos
    self[to_pos] = piece
  end

  def opponent?(pos, color)

    return false if self[pos].empty?
    self[pos].color != color
  end

  def ally?(pos, color)
    return false if self[pos].empty?
    self[pos].color == color
  end

  def valid_from_pos?(pos, color = :either)
    return false if pos.nil? || self[pos].empty?
    return true if color == :either
    self[pos].color == color
  end

  def valid_to_pos?(from_pos, pos)
    return false if pos.nil?
    piece = self[from_pos]
    piece.valid_moves.include?(pos)
  end

  def in_bounds?(pos)
    x, y = pos
    x.between?(0, 7) && y.between?(0, 7)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end
end

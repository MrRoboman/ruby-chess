require 'byebug'

module Slidable

  ORTHOGONAL = [
    [-1, 0], [0, 1], [1, 0], [0, -1]
  ]

  DIAGONAL = [
    [-1, -1], [1, 1], [1, -1], [-1, 1]
  ]

  def valid_moves
    moves = []
    deltas.each do |delta|
      moves.concat(get_moves(@pos, delta))
    end
    moves
  end

  def get_moves(pos, delta)
    x, y = pos
    dx, dy = delta
    new_pos = [x+dx, y+dy]
    return [] unless @board.in_bounds?(new_pos)
    [new_pos] + get_moves(new_pos, delta)
  end

end

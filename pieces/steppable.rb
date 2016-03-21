require 'byebug'

module Steppable

  def valid_moves
    deltas.map do |dx, dy|
      [x+dx, y+dy]
    end.select do |pos|
      @board.in_bounds?(pos) && !@board.ally?(pos, color)
    end
  end

end

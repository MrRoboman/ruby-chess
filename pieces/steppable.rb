require 'byebug'

module Steppable

  def valid_moves
    deltas.map do |dx, dy|
      [x+dx, y+dy]
    end.select { |pos| @board.in_bounds?(pos) }
  end

end

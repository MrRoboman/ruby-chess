require_relative 'manifest'
require 'byebug'
class Chess

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @from_pos = nil
    @to_pos = nil
    # players = [Player.new, Player.new]
  end

  def play
    while true
      @display.render
      get_input
      move_piece
    end
  end

  def get_input
    pos = @display.get_input
    if @from_pos.nil?
      @from_pos = pos if @board.valid_from_pos?(pos)
    elsif @to_pos.nil?
      @to_pos = pos if @board.valid_to_pos?(@from_pos, pos)
    end
  end

  def move_piece
    return if @from_pos.nil? || @to_pos.nil?
    @board.move(@from_pos, @to_pos)
    @from_pos, @to_pos = nil
  end

end

if __FILE__ == $PROGRAM_NAME
  Chess.new.play
end

require_relative 'manifest'
require 'byebug'
class Chess

  attr_reader :from_pos

  def initialize
    @board = Board.new
    @display = Display.new(@board, self)
    @from_pos = nil
    @to_pos = nil
    players = [Player.new(:white), Player.new(:black)]
  end

  def play
    while true
      @display.render
      puts "check" if @board.check?(:white)
      get_input
      move_piece
    end
  end

  def get_input
    pos = @display.get_input
    if @from_pos.nil?
      @from_pos = pos if @board.valid_from_pos?(pos)
    elsif @to_pos.nil?
      if @board.valid_to_pos?(@from_pos, pos)
        @to_pos = pos
      elsif pos == @from_pos
        @from_pos = nil
      end
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

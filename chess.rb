require_relative 'manifest'
require 'byebug'
class Chess

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    # players = [Player.new, Player.new]
  end

  def play
    while true
      @display.render
      @display.get_input
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  Chess.new.play
end

class Chess

  def initialize
    board = Board.new
    display = Display.new(board)
    players = [Player.new, Player.new]
  end

end

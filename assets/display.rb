require 'colorize'

class Display
  include Cursorable

  def initialize(board, chess)
    @chess = chess
    @board = board
    @cursor_pos = [0, 0]
    @selected = nil
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      #janky
      # color_options[:color] = piece.color == :white ? :green : :magenta
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @chess.from_pos
      bg = :magenta
      bg = :light_magenta if [i, j] == @cursor_pos
    elsif [i, j] == @cursor_pos
      bg = :light_yellow
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :blue
    end
    { background: bg}
  end

  def render
    system("clear")
    puts
    build_grid.each { |row| puts row.join }
  end
end

require 'colorize'

class Display
  include Cursorable

  def initialize(board)
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
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_blue
      # bg = :white
    else
      bg = :blue
      # bg = :light_black
    end
    { background: bg}#, color: :white }
  end

  def render
    system("clear")
    puts
    build_grid.each { |row| puts row.join }
  end
end

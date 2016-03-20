require 'singleton'

class NullPiece
  include Singleton

  def color
    :none
  end

  def empty?
    true
  end

  def to_s
    "   "
  end

  def inspect
    "null"
  end
end

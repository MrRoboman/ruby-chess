require 'singleton'

class NullPiece
  include Singleton

  def inspect
    "null"
  end
end

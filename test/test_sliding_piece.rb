require 'minitest/autorun'
require_relative '../lib/pieces/stepping_piece'
require_relative '../lib/board' # Refactor so this isn't a dependency

class TestSteppingPiece < MiniTest::Test
  def test_moves
    piece = SlidingPieceExample.new(Board.new, Vector[4, 4], :white)
    assert piece.moves == [Vector[5, 5], Vector[6, 6], Vector[7, 7]]
  end

  class SlidingPieceExample < SlidingPiece
    def directions
      [Vector[1, 1]]
    end
  end
end

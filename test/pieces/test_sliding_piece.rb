require 'minitest/autorun'
require_relative '../../lib/pieces/stepping_piece'
require_relative '../../lib/board' # Refactor so this isn't a dependency

class TestSlidingPiece < MiniTest::Test
  def test_moves
    piece = SlidingPieceExample.new(Board.new, Vector[4, 4], :white)
    assert Set.new(piece.moves) == Set.new([[5, 5], [6, 6], [7, 7]])
  end

  class SlidingPieceExample < SlidingPiece
    def directions
      [Vector[1, 1]]
    end
  end
end

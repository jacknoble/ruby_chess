require 'minitest/autorun'
require_relative '../lib/pieces/stepping_piece'
require_relative '../lib/board' # Refactor so this isn't a dependency

class TestSteppingPiece < MiniTest::Test
  def test_moves
    piece = SteppingPieceExample.new(Board.new, Vector[2, 2], :white)
    assert piece.moves == [Vector[3, 3], Vector[1, 1]]
  end

  class SteppingPieceExample < SteppingPiece
    def directions
      [Vector[1, 1], Vector[-1, -1]]
    end
  end
end

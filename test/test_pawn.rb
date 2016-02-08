require 'minitest/autorun'
require_relative '../lib/pieces/pawn'
require_relative '../lib/board' # Refactor so this isn't a dependency

class TestPawn < MiniTest::Test
  def test_moves_when_white_and_first_move
    piece = Pawn.new(Board.new, Vector[6, 6], :white)
    assert Set.new(piece.moves) == Set.new([[5, 6], [4, 6]])
  end

  def test_moves_when_black_and_first_move
    piece = Pawn.new(Board.new, Vector[1, 1], :black)
    assert Set.new(piece.moves) == Set.new([[2, 1], [3, 1]])
  end

  def test_moves_when_not_first_move
    piece = Pawn.new(Board.new, Vector[6, 6], :white)
    piece.move([4, 6])
    assert piece.moves == [[3, 6]]
  end

  def test_moves_when_not_clear
    piece = Pawn.new(board = Board.new, Vector[6, 6], :white)
    Pawn.new(board, Vector[5, 6], :black)
    assert piece.moves == []
  end

  def test_attacking_diagonal
    piece = Pawn.new(board = Board.new, Vector[6, 6], :white)
    Pawn.new(board, Vector[5, 5], :black)
    assert Set.new(piece.moves) == Set.new([[5, 6], [4, 6], [5, 5]])
  end
end

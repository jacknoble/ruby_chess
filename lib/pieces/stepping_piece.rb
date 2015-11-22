require_relative 'piece'
class SteppingPiece < Piece
  def moves
    possibilities = directions.map { |move| Vector[*move] + @position }
    legal_moves(possibilities).map(&:to_a)
  end
end

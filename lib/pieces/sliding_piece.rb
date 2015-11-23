require 'matrix'

class SlidingPiece < Piece
  def moves
    possibilities =
      directions.map do |direction|
        (1..7).map { |magnitude| magnitude * direction + @position }.
        take_while { |destination| @board.tile_clear?(destination) }
      end

    legal_moves(possibilities.flatten).map(&:to_a)
  end
end

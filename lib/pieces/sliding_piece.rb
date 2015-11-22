require 'matrix'

class SlidingPiece < Piece
  def moves
    move_possibilities = []
    directions.each do |direction|
      (1..7).each do |magnitude|
        pos_move = magnitude * Vector[*direction] + @position
        move_possibilities << pos_move
        break unless @board.tile_clear?(pos_move)
      end
    end

    legal_moves(move_possibilities).map(&:to_a)
  end
end

require 'matrix'
require_relative "piece"

class SlidingPiece < Piece

  def moves
    move_possibilities = []
    self.class::SLIDE_DIRECTIONS.each do |direction|
      (1..7).each do |magnitude|
        pos_move = (magnitude * Vector.elements(direction) + Vector.elements(@position)).to_a
        move_possibilities << pos_move
        break unless @board.tile_clear?(pos_move)
      end
    end

    legal_moves(move_possibilities)
  end

end

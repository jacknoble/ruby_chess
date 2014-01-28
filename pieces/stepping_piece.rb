class SteppingPiece < Piece

  def moves
    move_possibilities = []
    self.class::MOVES.each do |move|
      move_possibilities << [move[0] + @position[0], move[1] + @position[1]]
    end

    legal_moves(move_possibilities)
  end


end

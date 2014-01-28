class MoveError < StandardError
end


class Piece
  attr_accessor :board, :position, :color

  def initialize(board, position, black_or_white)
    @board, @position, @color = board, position, black_or_white
    @board[@position] = self
  end

  def move(destination)
    @board[@position] = nil
    @position = destination
    @board[destination] = self
    nil
  end

  private
    def moves
    end

    def legal_moves(move_possibilities)
      move_possibilities.select do |possibility|
        possibility.all? { |coord| (0..7).include?(coord) }  &&
        (@board.tile_clear?(possibility) || @board[possibility].color != @color)
      end
    end


end


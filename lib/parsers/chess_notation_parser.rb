require 'byebug'
class ChessNotationParser
  def parse(game, input)
    piece_type = infer_type(input)
    raw_dest = input.slice(-2, 2).split('')
    dest = convert_to_matrix_location(raw_dest)
    pieces = game.board.piece_set.select do |piece|
      piece.is_a?(piece_type) &&
      piece.moves.include?(dest) &&
      piece.color == game.turn
    end

    if pieces.length == 1
      [pieces[0].position.to_a, dest]
    end
  rescue
    puts 'Unintelligible move'
    retry
  end

  private

  def piece_type_notation
    {
      'N' => Knight,
      'B' => Bishop,
      'Q' => Queen,
      'R' => Rook,
      'K' => King
    }
  end

  def infer_type(input)
    piece_type_notation.fetch(input[0], Pawn)
  end

  def convert_to_matrix_location(pos)
    column, row = pos
    numerical_column = ('a'..'h').to_a.index(column)
    numerical_row = 8 - Integer(row)

    [numerical_row, numerical_column]
  end

end

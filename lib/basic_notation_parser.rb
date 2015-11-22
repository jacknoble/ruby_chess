class BasicNotationParser
  def parse(input)
    origin, dest = input.split('-')
    origin = convert_to_matrix_location(origin.split(''))
    dest = convert_to_matrix_location(dest.split(''))

    [origin, dest]
  end

  def convert_to_matrix_location(pos)
    column, row = pos
    numerical_column = ('a'..'h').to_a.index(column)
    numerical_row = 8 - Integer(row)

    [numerical_row, numerical_column]
  end
end

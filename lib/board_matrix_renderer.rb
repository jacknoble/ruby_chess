require 'paint'
class BoardMatrixRenderer
  def initialize(matrix)
    @matrix = matrix
    color1 = (ENV['CHESS_COLOR1'] || 'red').to_sym
    color2 = (ENV['CHESS_COLOR2'] || 'blue').to_sym

    @tile_colors = [color1, color2]
  end

  def render
    build_display
    add_labels
    @display.map { |row| row.join('') }.join("\n")
  end

  private

  def build_display
    @display =
      @matrix.each_with_index.map do |row, row_i|
        row.each_with_index.map do |piece, col_i|
          display_character(piece, row_i, col_i)
        end
      end
  end

  def add_labels
    @display << ('A'..'H').map { |letter| pad(letter) }
    @display.each_with_index do |row, i|
      row << " #{8 - i}"
    end
  end

  def pad(string)
    " #{string} "
  end

  def display_character(piece, row_i, col_i)
    color = piece.color if piece
    background = @tile_colors[(row_i + col_i) % 2]
    Paint[pad(piece || ' '), color, background]
  end
end

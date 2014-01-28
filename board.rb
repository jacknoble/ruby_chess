require "colorize"
require_relative "chess_pieces"
class Board
  attr_accessor :matrix, :piece_set


  def initialize
    @matrix = Array.new(8) { Array.new(8) }
  end

  def self.starting_board
   Board.new.set_pieces
  end

  def set_pieces
    set_pawns
    set_back_row
    self
  end


  def [](pos)
    row, col = pos
    @matrix[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @matrix[row][col] = piece
  end

  def tile_clear?(pos)
    row, col = pos
    @matrix[row].nil? || @matrix[row][col].nil?
  end

  def to_s
    offset = 0
    display = self.dup
    display.matrix.each_with_index do |row, row_i|
      row.map! do |piece|
        offset += 1
        if piece.nil?
          disp_char = "   "
          if (row_i + offset).even?
            disp_char.colorize(:background => :blue )
          else
            disp_char.colorize(:background => :red )
          end
        else
          disp_char = " " + piece.to_s + " "
          if (row_i + offset).even?
            disp_char.colorize(:color => piece.color, :background => :blue )
          else
            disp_char.colorize(:color => piece.color, :background => :red )
          end
        end
      end
    end
    display.matrix << [" A ", " B ", " C ", " D ", " E ", " F ", " G ", " H "]
    display.matrix.each_with_index do |row, i|
      row << " #{8-i}"
    end
    display.matrix.map{|row| row.join("") }.join("\n")
  end

  def check?(color)
    king_pos = find_king_pos(color)
    enemy_moves = []

    piece_set.each do |piece|
      enemy_moves += piece.moves if piece.color != color
    end

    enemy_moves.include?(king_pos)
  end

  def checkmate?(color)
    return false unless check?(color)
    piece_and_moves = []
    dup.piece_set.each do |piece|
      if piece.color == color
        piece_and_moves << [piece, piece.moves]
      end
    end
    piece_and_moves.all? do |piece|
      piece[1].all? do |test_move|
        board_copy = self.dup
        piece[0].board = board_copy
        piece[0].move(test_move)
        board_copy.check?(color)
      end
    end
  end

  def dup
     board_copy = Board.new
     piece_set.each do |piece|
       piece.class.new(board_copy, piece.position, piece.color)
     end

     board_copy
  end

  def piece_set
    @matrix.flatten.select{|tile| !tile.nil?}
  end

  private

    def find_king_pos(color)
      king_position = nil
      piece_set.each do |piece|
        if piece.is_a?(King) && piece.color == color
          king_position = piece.position
        end
       end
      king_position
    end


    def set_back_row
      bothsides = [[0, :black], [7, :white]]
      bothsides.each do |side|
        BACK_ROW.each_with_index do |piece, piece_index|
          Object.const_get(piece).new(self, [side[0], piece_index], side[1])
        end
      end
    
    end
    
    BACK_ROW = ["Rook","Knight","Bishop","Queen","King","Bishop","Knight","Rook"]

    def set_pawns
      #hashmap to begin game OR array of classes
      @matrix[1].each_index do |tile|
        Pawn.new(self, [1, tile], :black)
      end

      @matrix[6].each_index do |tile|
        Pawn.new(self, [6, tile], :white)
      end
    end

end

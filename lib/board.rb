require 'colorize'
require_relative 'chess_pieces'
require_relative 'board_matrix_renderer'
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
    row, col = pos.to_a
    @matrix[row][col]
  end

  def []=(pos, piece)
    row, col = pos.to_a
    @matrix[row][col] = piece
  end

  def tile_clear?(pos)
    row, col = pos.to_a
    @matrix[row].nil? || @matrix[row][col].nil?
  end

  def to_s
    BoardMatrixRenderer.new(@matrix).render
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
    piece_moves =
      dup.piece_set.map do |piece|
        next if piece.color != color
        [piece, piece.moves]
      end

    piece_moves.all? do |piece, moves|
      moves.all? do |test_move|
        piece.board = dup
        piece.move(test_move)
        piece.board.check?(color)
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
    @matrix.flatten.select { |tile| !tile.nil? }
  end

  private

  def find_king_pos(color)
    piece_set.find do |piece|
      piece.is_a?(King) && piece.color == color
    end.position
  end

  BACK_ROW = %w(Rook Knight Bishop Queen King Bishop Knight Rook)

  def set_back_row
    bothsides = [[0, :black], [7, :white]]
    bothsides.each do |row, color|
      BACK_ROW.each_with_index do |piece, piece_index|
        Object.const_get(piece).new(self, [row, piece_index], color)
      end
    end
  end

  def set_pawns
    @matrix[1].each_index do |tile|
      Pawn.new(self, [1, tile], :black)
    end

    @matrix[6].each_index do |tile|
      Pawn.new(self, [6, tile], :white)
    end
  end
end

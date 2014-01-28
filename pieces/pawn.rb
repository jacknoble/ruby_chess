# -*- coding: utf-8 -*-
class Pawn < Piece

  def initialize(board, position, color)
    super
    @first_move = true
  end

  def to_s
    "♙"
  end

  def move(pos)
    super(pos)
    @first_move = false
    nil
  end

  def moves
    move_possibilities = []

    @pawn_moves = PAWN_MOVES.dup
    val = ((@color == :white) ? -1 : 1)
    @pawn_moves.each do |move_possibility|
      x, y = move_possibility[0] * val + @position[0], move_possibility[1] * val + @position[1]
      if @board.tile_clear?([x,y])
        if move_possibility == [1,0]
          @pawn_moves << [2, 0] if @first_move
          move_possibilities << [x, y]
        elsif move_possibility == [2,0]
          move_possibilities << [x,y]
        end
      elsif !@board.tile_clear?([x,y]) && @board[[x,y]].color != self.color
        move_possibilities << [x, y] unless move_possibility[1] == 0
      end
    end

    move_possibilities
  end

  PAWN_MOVES = [[1, 0], [1, -1], [1, 1]]
end
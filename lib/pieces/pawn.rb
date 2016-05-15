# -*- coding: utf-8 -*-
require_relative 'piece'

class Pawn < Piece
  def initialize(board, position, color)
    super
    @initial_position = @position
  end

  def to_s
    '♙'
  end

  def moves
    (move_possibilities + attack_possibilities).map(&:to_a)
  end

  private

  def first_move?
    @position == @initial_position
  end

  def orientation
    @color == :white ? -1 : 1
  end

  def move_possibilities
    vectors = [Vector[1, 0]]
    vectors << Vector[2, 0] if first_move?
    vectors.map { |vector| vector * orientation }.
      map { |dir| dir + @position }.
      take_while { |dest| @board.tile_clear?(dest) }
  end

  def attack_possibilities
    [Vector[1, 1], Vector[1, -1]].map { |vector| vector * orientation }.
      map { |dir| dir + @position }.
      select { |pos| !@board.tile_clear?(pos) }.
      select { |pos| @board[pos].color != color }
  end
end

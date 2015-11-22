# -*- coding: utf-8 -*-
class Rook < SlidingPiece
  SLIDE_DIRECTIONS = [[-1, 0],
                      [0, -1],
                      [0, 1],
                      [1, 0]]

  def to_s
    '♖'
  end

  def directions
    [1, 0, -1].permutation(2).
      to_a.select { |row, col| (row + col).odd? }.
      map { |dir| Vector[*dir] }
  end
end

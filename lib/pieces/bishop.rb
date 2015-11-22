# -*- coding: utf-8 -*-
class Bishop < SlidingPiece
  def to_s
    '♗'
  end

  def directions
    [1, 0, -1].permutation(2).
      to_a.select { |row, col| (row + col).even? }.
      map { |dir| Vector[*dir] }
  end
end

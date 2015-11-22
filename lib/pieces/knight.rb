# -*- coding: utf-8 -*-
class Knight < SteppingPiece
  def to_s
    '♘'
  end

  def directions
    [1, -1, 2, -2].permutation(2).
      select { |row, col| row.abs != col.abs }.
      map { |dir| Vector[*dir] }
  end
end

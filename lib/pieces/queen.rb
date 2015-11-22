# -*- coding: utf-8 -*-
class Queen < SlidingPiece
  SLIDE_DIRECTIONS =
  def to_s
    '♕'
  end

  def directions
    [1, 0, -1].permutation(2).map do |dir|
      Vector[*dir]
    end
  end
end

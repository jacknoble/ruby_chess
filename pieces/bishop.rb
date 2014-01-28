# -*- coding: utf-8 -*-
class Bishop < SlidingPiece
  SLIDE_DIRECTIONS = [[-1, -1],
                      [-1, 1],
                      [1, -1],
                      [1, 1]]

  def to_s
    "♗"
  end
end

# -*- coding: utf-8 -*-
class Queen < SlidingPiece
  SLIDE_DIRECTIONS = [[-1, -1],
                      [-1, 0],
                      [-1, 1],
                      [0, -1],
                      [0, 1],
                      [1, -1],
                      [1, 0],
                      [1, 1]]

  def to_s
    "♕"
  end

end
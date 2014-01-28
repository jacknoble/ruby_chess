# -*- coding: utf-8 -*-
class Rook < SlidingPiece
  SLIDE_DIRECTIONS = [[-1, 0],
                      [0, -1],
                      [0, 1],
                      [1, 0]]

  def to_s
    "♖"
  end

end
# -*- coding: utf-8 -*-
class King < SteppingPiece

  MOVES = [[-1, -1],
          [-1, 0],
          [-1, 1],
          [0, -1],
          [0, 1],
          [1, -1],
          [1, 0],
          [1, 1]]

  def to_s
    "♔"
  end

end
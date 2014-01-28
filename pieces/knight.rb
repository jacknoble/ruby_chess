# -*- coding: utf-8 -*-
class Knight < SteppingPiece

MOVES = [[-2,-1],
        [-2, 1],
        [2, -1],
        [2, 1],
        [-1, 2],
        [1, 2],
        [1, -2],
        [-1, -2]]


    def to_s
      "♘"
    end

end

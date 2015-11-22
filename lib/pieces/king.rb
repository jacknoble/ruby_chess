# -*- coding: utf-8 -*-
class King < SteppingPiece
  def to_s
    '♔'
  end

  def directions
    [1, 0, -1].permutation(2).to_a.map do |dir|
      Vector[*dir]
    end
  end
end

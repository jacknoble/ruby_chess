require_relative 'game'

b = Board.starting_board
puts b

b[[0,3]] = Queen.new(b, [0,3], :white)
b[[0,2]] = Queen.new(b, [0,2], :white)
puts b
puts b.checkmate?(:black)
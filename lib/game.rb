require_relative "chess_pieces"
require_relative "board"

class Game
  attr_accessor :board, :turn

  def initialize
    @board = Board.starting_board
    @turn = :white
  end

  def play
    until over?
      take_turn
      @turn = ((@turn == :white) ? :black : :white)
    end

    if @board.checkmate?(:white)
      puts "Black wins!"
    else
      puts "White wins!"
    end

    puts @board
  end

  def take_turn
    move = get_move
    piece_to_move = @board[move[0]]
    destination = move[1]
    fail MoveError, "No piece there." if piece_to_move.nil?
    fail MoveError, "That's not your piece." if piece_to_move.color != @turn
    unless piece_to_move.moves.include?(destination)
      fail MoveError, "Not a legal move!"
    end

    piece_to_move.move(destination)

  rescue MoveError => e
    puts "#{e.message}"
    retry
  end

  def get_move
    puts @board
    puts "#{@turn.to_s.capitalize} to move."

    pos, dest = gets.chomp.split("-")
    pos = parse_chess_notation(pos.split(""))
    dest = parse_chess_notation(dest.split(""))

    [pos, dest]
  end

  def parse_chess_notation(pos)
    pos[0] = ('a'..'h').to_a.index(pos[0])
    pos[1] = 8 - pos[1].to_i
    pos[0], pos[1] = pos[1], pos[0]
    pos
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end
end

if $PROGRAM_NAME == __FILE__
  g = Game.new
  g.play
end

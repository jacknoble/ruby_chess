require_relative 'chess_pieces'
require_relative 'board'
require_relative 'console_renderer'
require_relative 'console_player'
require 'forwardable'

class Game
  extend Forwardable
  attr_accessor :board

  def initialize(renderer = ConsoleRenderer.new, player_interface = ConsolePlayer.new)
    @board = Board.starting_board
    @move_order = [:white, :black]
    @renderer = renderer
    @player_interface = player_interface
  end

  def turn
    @move_order.first
  end

  def play(turns = Float::INFINITY)
    while turns > 0
      break if over?
      take_turn
      @move_order.rotate!
      turns -= 1
    end

    if @board.checkmate?(:white)
      render 'Black wins!'
    else
      render 'White wins!'
    end

    render @board
  end

  private

  def take_turn
    render(@board, "#{turn.to_s.capitalize} to move.")
    move = input_move
    piece_to_move = @board[move[0]]
    destination = move[1]

    fail MoveError, 'No piece there.' if piece_to_move.nil?
    fail MoveError, "That's not your piece." if piece_to_move.color != turn
    unless piece_to_move.moves.include?(destination)
      fail MoveError, 'Not a legal move!'
    end

    piece_to_move.move(destination)

  rescue MoveError => e
    render "#{e.message}"
    if @player_interface.retry_on_move_error?
      retry
    else
      raise
    end
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end

  private def_delegator :@renderer, :render
  private def_delegator :@player_interface, :input_move
end

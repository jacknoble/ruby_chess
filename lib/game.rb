require_relative 'chess_pieces'
require_relative 'board'
require_relative 'console_renderer'
require_relative 'console_player'
require 'forwardable'
require_relative 'config'

class Game
  extend Forwardable
  attr_accessor :board

  def self.configure
    @config = Config.new
    yield @config
  end

  def self.config
    return @config if defined?(@config)
    @config = Config.new
  end

  def initialize
    @board = Board.starting_board
    @renderer = Game.config.renderer
    @move_order = [Game.config.player1, Game.config.player2]
  end

  def current_player
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

  def turn
    current_player.color
  end

  private

  def take_turn
    render(@board, "#{current_player.color.to_s.capitalize} to move.")
    move = input_move(self)
    piece_to_move = @board[move[0]]
    destination = move[1]

    fail MoveError, 'No piece there.' if piece_to_move.nil?
    fail MoveError, "That's not your piece." if piece_to_move.color != current_player.color
    unless piece_to_move.moves.include?(destination)
      fail MoveError, 'Not a legal move!'
    end

    piece_to_move.move(destination)

  rescue MoveError => e
    render "#{e.message}"
    if current_player.retry_on_move_error?
      retry
    else
      raise
    end
  end

  def over?
    @board.checkmate?(:white) || @board.checkmate?(:black)
  end

  private def_delegator :@renderer, :render
  private def_delegator :current_player, :input_move
end

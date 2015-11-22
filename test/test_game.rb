require 'minitest/autorun'
require_relative '../lib/game'

class TestGame < MiniTest::Unit::TestCase
  def test_turn_taking_with_correct_input
    origin = [6, 4]
    destination = [4, 4]
    game = Game.new(TestRenderer.new, TestPlayer.new([origin, destination]))
    piece = game.board[origin]

    game.play(1)
    assert game.board[destination] == piece
    assert game.turn == :black
  end

  def test_when_piece_is_not_there
    origin = [5, 4]
    destination = [4, 4]
    game = Game.new(TestRenderer.new, TestPlayer.new([origin, destination]))

    err = assert_raises MoveError do
      game.play(1)
    end

    assert_match(/no piece/i, err.message)
  end

  def test_when_piece_is_not_players
    origin = [1, 4]
    destination = [3, 4]
    game = Game.new(TestRenderer.new, TestPlayer.new([origin, destination]))

    err = assert_raises MoveError do
      game.play(1)
    end

    assert_match(/not your piece/i, err.message)
  end

  def test_when_move_is_illegal
    origin = [6, 4]
    destination = [3, 4]
    game = Game.new(TestRenderer.new, TestPlayer.new([origin, destination]))

    err = assert_raises MoveError do
      game.play(1)
    end

    assert_match(/legal/i, err.message)
  end
end

class TestRenderer
  def render(*)
  end
end

class TestPlayer
  attr_accessor :input_move
  def initialize(move)
    @input_move = move
  end

  def retry_on_move_error?
    false
  end
end

require 'minitest/autorun'
require_relative '../lib/game'

class TestGame < MiniTest::Test
  def test_turn_taking_with_correct_input
    origin = [6, 4]
    destination = [4, 4]

    Game.configure do |config|
      config.renderer = TestRenderer.new
      config.player1 = TestPlayer.new([origin, destination])
    end

    game = Game.new
    piece = game.board[origin]

    game.play(1)

    assert game.board[destination] == piece
    :qa
    assert game.turn == :black
  end

  def test_when_piece_is_not_there
    origin = [5, 4]
    destination = [4, 4]

    Game.configure do |config|
      config.renderer = TestRenderer.new
      config.player1 = TestPlayer.new([origin, destination])
    end

    game = Game.new

    err = assert_raises MoveError do
      game.play(1)
    end

    assert_match(/no piece/i, err.message)
  end

  def test_when_piece_is_not_players
    origin = [1, 4]
    destination = [3, 4]
    Game.configure do |config|
      config.renderer = TestRenderer.new
      config.player1 = TestPlayer.new([origin, destination])
    end

    game = Game.new


    err = assert_raises MoveError do
      game.play(1)
    end

    assert_match(/not your piece/i, err.message)
  end

  def test_when_move_is_illegal
    origin = [6, 4]
    destination = [3, 4]

    Game.configure do |config|
      config.renderer = TestRenderer.new
      config.player1 = TestPlayer.new([origin, destination])
    end

    game = Game.new

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
  def initialize(move)
    @input_move = move
  end

  def color
    :white
  end

  def input_move(_game)
    @input_move
  end

  def retry_on_move_error?
    false
  end
end

require 'minitest/autorun'
require_relative '../lib/board'
require 'minitest/assertions'

class TestBoard < MiniTest::Test
  def test_to_s
    assert_equal Board.starting_board.to_s, COLORED_BOARD.chomp
  end
end

COLORED_BOARD = <<-STR
\e[30;41m ♖ \e[0m\e[30;44m ♘ \e[0m\e[30;41m ♗ \e[0m\e[30;44m ♕ \e[0m\e[30;41m ♔ \e[0m\e[30;44m ♗ \e[0m\e[30;41m ♘ \e[0m\e[30;44m ♖ \e[0m 8\n\e[30;44m ♙ \e[0m\e[30;41m ♙ \e[0m\e[30;44m ♙ \e[0m\e[30;41m ♙ \e[0m\e[30;44m ♙ \e[0m\e[30;41m ♙ \e[0m\e[30;44m ♙ \e[0m\e[30;41m ♙ \e[0m 7\n\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m 6\n\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m 5\n\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m 4\n\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m\e[44m   \e[0m\e[41m   \e[0m 3\n\e[37;41m ♙ \e[0m\e[37;44m ♙ \e[0m\e[37;41m ♙ \e[0m\e[37;44m ♙ \e[0m\e[37;41m ♙ \e[0m\e[37;44m ♙ \e[0m\e[37;41m ♙ \e[0m\e[37;44m ♙ \e[0m 2\n\e[37;44m ♖ \e[0m\e[37;41m ♘ \e[0m\e[37;44m ♗ \e[0m\e[37;41m ♕ \e[0m\e[37;44m ♔ \e[0m\e[37;41m ♗ \e[0m\e[37;44m ♘ \e[0m\e[37;41m ♖ \e[0m 1\n A  B  C  D  E  F  G  H  0
STR

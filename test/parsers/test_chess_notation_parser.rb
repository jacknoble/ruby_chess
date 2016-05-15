require 'minitest/autorun'
require_relative '../../lib/parsers/chess_notation_parser'
require 'byebug'

class TestChessNotationParser < MiniTest::Test
  def test_parsing
    assert ChessNotationParser.new.parse(Game.new, 'e4') == [[6, 4], [4, 4]]
  end
end

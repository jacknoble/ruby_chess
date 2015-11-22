require 'minitest/autorun'
require_relative '../lib/basic_notation_parser'

class TestBasicNotationParser < MiniTest::Test
  def test_parsing
    assert BasicNotationParser.new.parse('e2-e4') == [[6, 4], [4, 4]]
  end
end

require 'minitest/autorun'

class TestBasicNotationParser < MiniTest::Test
  def test_parsing
    assert BasicNotationParser.new.parse(Game.new, 'e2-e4') == [[6, 4], [4, 4]]
  end
end

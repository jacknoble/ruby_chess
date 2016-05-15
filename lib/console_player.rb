require_relative 'parsers/basic_notation_parser'
class ConsolePlayer
  attr_reader :color

  def initialize(color)
    @color = color
    @parser = Game.config.parser
  end

  def input_move(game)
    @parser.parse(game, gets.chomp)
  end

  def retry_on_move_error?
    true
  end
end

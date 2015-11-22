require_relative 'basic_notation_parser'
class ConsolePlayer
  def initialize(notation_parser = BasicNotationParser.new)
    @parser = notation_parser
  end

  def input_move
    @parser.parse(gets.chomp)
  end

  def retry_on_move_error?
    true
  end
end

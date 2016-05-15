class Config
  attr_writer :renderer, :player1, :player2, :console_notation

  def renderer
    @renderer ||= ConsoleRenderer.new
  end

  def player1
    @player1 ||= ConsolePlayer.new(:white)
  end

  def player2
    @player2 ||= ConsolePlayer.new(:black)
  end

  def parser
    return @parser if defined?(@parser)
    notation = @console_notation || :chess
    parser_class = "#{notation.to_s.capitalize}NotationParser"
    @parser = Object.const_get(parser_class).new
  end
end

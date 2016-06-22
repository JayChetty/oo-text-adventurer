class Game

  attr_reader :adventurer, :runes, :is_over, :current_target

  def initialize(options = {})
    @adventurer = options[:adventurer]
    @runes = options[:runes]
    @is_over = false
    @current_target = options[:target]
  end

end

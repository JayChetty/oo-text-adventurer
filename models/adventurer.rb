class Adventurer
  attr_reader :runes, :current_rune, :current_summon
  def initialize
    @runes = []
    @current_rune = nil
    @current_summon = nil
  end

  def add_rune(rune_class)
    @runes << rune_class
  end

  def set_current_rune(index)
    @current_rune = @runes[index]
  end

  def summon_from_rune
    @current_summon = @current_rune.send(:new)
  end
end

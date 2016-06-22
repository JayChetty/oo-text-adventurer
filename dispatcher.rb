class Dispatcher

  def initialize(game)
    @game = game
  end

  def show_runes
    puts "Current Runes"
    @game.adventurer.runes.each do |c|
      separator = @game.adventurer.current_rune == c ? "**" : ""
      puts "#{separator} #{c} #{separator}"
    end
  end


  def show_selected_rune
    puts "Selected rune:  #{@game.adventurer.current_rune }"
  end

  def game_in_play?
    return !@game.is_over
  end

  def summon
    @game.adventurer.summon_from_rune
  end

  def power
    show_powers
    puts "enter the power you want to use"
    power = gets.chomp()
    puts "you chose to use #{power}"
    @game.adventurer.current_summon.send(power, @game.current_target)
    puts "Target defeated!" if(@game.current_target.health <= 0)
  end

  def show_powers
    @game.adventurer.current_summon.public_methods(false).each do |action|
      puts "#{action}"
    end
  end

  def show_target
    puts "Target: #{@game.current_target.name} - current health #{@game.current_target.health}"
  end

end
require_relative('models/adventurer')

class StickRune
  def hit(target)
    target.take_hit(10)
  end
end

class Target
  attr_reader :health
  def initialize(health)
    @health = health
  end

  def take_hit(damage)
    @health -= damage
  end
end

class Runner
  Menu = {
    "1" => {text: "Show Runes", method: "show_runes"},
    "2" => {text: "Summon Selected Rune", method: "summon"},
    "3" => {text: "Use Summon Power", method: "power"}
  }

  def initialize
    @adventurer = Adventurer.new()
    @adventurer.add_rune( StickRune )
    @adventurer.set_current_rune(0)
    @door = Target.new(20)
  end

  def show_adventurer
    show_runes()
    show_current_summon
  end

  def show_runes
    puts "Current Runes"
    @adventurer.runes.each do |c|
      puts "**" if @adventurer.current_rune == c
      puts "#{c}"
      puts "**" if @adventurer.current_rune == c
    end
  end

  def show_current_summon
    puts "Current Summon #{@adventurer.current_summon}"
  end

  def show_target
    puts "Target, current health #{@door.health}"
  end

  def start
    puts "Welcome Adventurer"
    while !level_won?
      show_adventurer()
      show_target()
      display_menu()
      puts "Choose option"
      chosen_option = gets.chomp
      select_option( chosen_option )
    end

    puts "You smashed down the door using your summon of a rune. Respect!"
  end

  def display_menu
    puts "Menu, choose option"
    Runner::Menu.each do |k,v|
      puts "#{k} - #{v[:text]}"
    end
  end

  def level_won?
    @door.health <= 0
  end


  def select_option(chosen)
    selection = Runner::Menu[chosen]
    if !selection
      puts "Invalid Option"
    end
    puts "You chose #{selection[:text]}"
    self.send( selection[:method] )
  end

  def summon
    @adventurer.summon_from_rune
  end

  def power
    show_powers
    puts "enter the power you want to use"
    power = gets.chomp()
    @adventurer.current_summon.send(power, @door)
  end

  def show_powers
    @adventurer.current_summon.public_methods(false).each do |action|
      puts "#{action}"
    end
  end


end


r = Runner.new()
r.start()

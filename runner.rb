require_relative('models/adventurer')

class TestRune
  def talk
    "Yo Yo"
  end
end


class Runner
  Menu = {
    "1" => {text: "Show Runes", method: "show_runes"},
    "2" => {text: "Summon Selected Rune", method: "summon"}
  }

  def initialize
    @adventurer = Adventurer.new()
    @adventurer.add_rune( TestRune )
    @adventurer.set_current_rune(0)
  end

  def show_adventurer
    show_runes()
    show_current_summon
  end

  def show_runes
    @adventurer.runes.each do |c|
      puts "**" if @adventurer.current_rune == c
      puts "#{c}"
      puts "**" if @adventurer.current_rune == c
    end
  end

  def show_current_summon
    puts "Current Summon #{@adventurer.current_summon}"
  end

  def start
    puts "Welcome adventurer"
    while true
      show_adventurer()
      display_menu()
      puts "Choose option"
      chosen_option = gets.chomp
      select_option( chosen_option )
    end
  end

  def display_menu
    puts "Menu, choose option"
    Runner::Menu.each do |k,v|
      puts "#{k} - #{v[:text]}"
    end
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


end


r = Runner.new()
r.start()

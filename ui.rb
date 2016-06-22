require_relative('models/game')
require_relative('models/adventurer')
require_relative('models/stick_rune')

class Ui
  Menu = {
    "1" => {text: "Show Runes", method: "show_runes"},
    "2" => {text: "Show Target", method: "show_target"},
    "3" => {text: "Summon Selected Rune", method: "summon"},
    "4" => {text: "Use Summon Power", method: "power"}
  }

  def initialize(dispatcher)
    @dispatcher = dispatcher
  end

  def start
    while(@dispatcher.game_in_play?)
      puts "Welcome adventurer!"
      @dispatcher.show_target
      display_menu
      puts "Choose option"
      chosen_option = gets.chomp
      select_option( chosen_option )
    end
  end

  def display_menu
    puts "Menu, choose option"
    Ui::Menu.each do |k,v|
      puts "#{k} - #{v[:text]}"
    end
  end

  def select_option(chosen)
    selection = Ui::Menu[chosen]
    if !selection
      puts "Invalid Option"
    end
    puts "You chose #{selection[:text]}"
    @dispatcher.send( selection[:method] )
  end

end
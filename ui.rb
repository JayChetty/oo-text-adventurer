class Ui
  Menu = {
    "1" => {text: "Show Runes", method: "show_runes"},
    "2" => {text: "Show Target", method: "show_target"},
    "3" => {text: "Summon Selected Rune", method: "summon"},
    "4" => {text: "Use Summon Power", method: "power"},
    "Q" => {text: "Quit"}
  }

  def initialize(dispatcher)
    @dispatcher = dispatcher
  end

  def separator
    puts "----------------"
  end

  def start
    puts "+++++++++++++++"
    puts "Welcome adventurer!"
    while(@dispatcher.game_in_play?)
      separator
      @dispatcher.show_selected_rune
      @dispatcher.show_target
      separator
      display_menu
      puts "Choose option"
      separator
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
    abort("Your adventure is over") if chosen.downcase == "q"
    selection = Ui::Menu[chosen]
    if !selection
      puts "Invalid Option"
    end
    @dispatcher.send( selection[:method] )
  end

end
class Ui
  Menu = {
    "1" => {text: "Show Runes", method: "show_runes"},
    "2" => {text: "Show Target", method: "show_target"},
    "3" => {text: "Summon Selected Rune", method: "summon"},
    "4" => {text: "Use Summon Power", method: "power"},
    "q" => {text: "Quit", method: "quit"},
    "c" => {text: "Clear screen", method: "clear"}
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
    puts "Please choose an option" if !chosen
    selection = Ui::Menu[chosen.downcase]
    puts "Invalid Option" if !selection
    receiver = chosen.to_i == 0 ? self : @dispatcher
    receiver.send( selection[:method] )
  end

  def quit
    abort("Your adventure is over")
  end

  def clear
    system "clear"
  end

end
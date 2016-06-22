require_relative('models/adventurer')
require_relative('models/game')
require_relative('models/runes/stick_rune')
require_relative('models/runes/magic_hat_rune')
require_relative('models/target')
require_relative('ui')
require_relative('dispatcher')

adventurer = Adventurer.new
adventurer.add_rune( StickRune )
adventurer.set_current_rune(0)

game = Game.new(adventurer: adventurer, runes:[MagicHatRune], target: Target.new(20, "Door"))

ui = Ui.new(Dispatcher.new(game))
ui.start
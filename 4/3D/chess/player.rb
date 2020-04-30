require_relative 'human_player'
require_relative 'computer_player'

class Player
    def initialize(color, display)
        @color = color
        @display = display
    end
end
require_relative 'display'
require_relative 'board'
require_relative './players/player.rb'

class Game
    def initialize
        @board
        @display
        @players = Hash.new
        # @current_player = symbol
    end

    def play

    end
    
    private

    def notify_players

    end

    def swap_turn!

    end

end
require_relative "board.rb"
require_relative "players.rb"

class Game
    attr_reader :board, :player1, :player2
    attr_accessor :current_player, :game

    def initialize(player1_mark, player2_mark) 
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @current_player = @player1
        @board = Board.new
    end

    def switch_turn
        current_player == player1 ? @current_player = player2 : @current_player = player1
    end

    def play  
        while board.empty_positions? && !board.win?(current_player.mark)
            board.print
            pos = current_player.get_position
            if board.valid_position?(pos) && board.empty?(pos)
                board.place_mark(pos, current_player.mark)
                return "#{current_player.mark} WINS!!!" if board.win?(current_player.mark)
                switch_turn
            else
                puts 
                puts "position not chill brah!!"
            end
        end
        return "DRAW" if !board.empty_positions?
    end

end


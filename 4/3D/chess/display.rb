require_relative 'cursor'
require_relative 'board'

class Display
    attr_reader :board
    def initialize(board)
        @board = board
        @cursor = nil
    end

    def render
        # self.board
    end


end
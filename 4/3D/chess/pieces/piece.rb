require_relative 'modules'


class Piece
    attr_reader :start_pos, :pos

    def initialize(pos)
        @start_pos = pos
        # @color
        # @board
        @pos = pos
    end

    def to_s
        
    end

    def empty? #pos

    end

    def valid_moves
        self.moves.select do |move|
            #move.? {|num| num > 7) && !(num < 0)}
            move[0] >= 0 && move[0] < 8 &&
            move[1] >= 0 && move[1] < 8
        end

    end

    def pos=(val)
    end

    def symbol
        
    end

    private
    def move_into_check?(end_pos)
    end

end
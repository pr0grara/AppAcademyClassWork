require_relative 'piece'

class King < Piece
    include Stepable
    def initialize(pos=[0,4])
        super
    end

    def symbol
        
    end

    protected
    
    def move_diffs
        [[1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1], [1,-1]]
    end


end
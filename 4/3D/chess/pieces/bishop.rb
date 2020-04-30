require_relative 'piece'

class Bishop < Piece
    include Slideable
    def initialize(pos=[0,2])
        super
    end

    def symbol
        
    end

    protected
    
    def move_dirs
        [[1,1], [1,-1], [-1,1], [-1,-1]]
    end
end
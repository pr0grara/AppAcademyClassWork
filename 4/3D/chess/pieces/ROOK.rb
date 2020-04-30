require_relative 'piece'

class Rook < Piece
    include Slideable
    def initialize(pos=[0,0])
        super
    end

    def symbol
        
    end

    protected
    
    def move_dirs
        [[1,0], [0,1], [-1,0], [0,-1]]
    end

end
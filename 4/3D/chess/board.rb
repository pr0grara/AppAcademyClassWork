require_relative "./pieces/piece.rb"
require_relative './pieces/piece_list.rb'

class MoveError < StandardError
end
_
class Board
    def initialize
        @grid = Array.new(8){Array.new(8,nil)} #{|j| Piece.new([i,j])}}
        p @grid
        #@rows
        #@sentinel
        rook_array = [[0,0], [0,7], [7,0], [7,7]]   
        knight_array = [[0,1], [0,6], [7,1], [7,6]]
        bishop_array = [[0,2], [0,5], [7,2], [7,5]]
        king_array = [[0,3], [7,3]]
        queen_array = [[0,4], [7,4]]
        pawn_rows = [1,6]
        pawn_range = (0..7)
        rook_array.each { |pos| self[pos] = Piece.new(pos) }
        knight_array.each { |pos| self[pos] = Piece.new(pos) }
        bishop_array.each { |pos| self[pos] = Piece.new(pos) }
        king_array.each { |pos| self[pos] = Piece.new(pos) }
        queen_array.each { |pos| self[pos] = Piece.new(pos) }
        pawn_rows.each {|i| pawn_range.each {|j| self[[i,j]] = Piece.new([i,j]) }}
        # @grid[1].each_with_index { |squ, i| squ = Piece.new([1, i]) }
        # @grid[6].each_with_index { |squ, i| squ = Piece.new([6, i]) }
        # (2..5).each do |row|
        #   row.each do |col|
        #     @grid[row][col] = Piece.new([row,col])
        #   end
        # end
    end

    def [](pos)
        raise MoveError unless valid_pos?(pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def move_piece(color, start_pos, end_pos)
        raise MoveError unless self[start_pos].is_a?(Piece) && valid_pos?(end_pos) 
        self[end_pos] = self[start_pos]
        self[end_pos].pos = end_pos
        #self[start_pos] = sentinel
    end

    def move_piece!(color, start_pos, end_pos)
    
    end

    def valid_pos?(pos)
        pos[0] >= 0 && pos[0] < 8 &&
        pos[1] >= 0 && pos[1] < 8
    end

    def add_piece(piece, pos)

    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)

    end

    def pieces

    end

    def dup

    end

    
end

if $LOAD_PATH == __FILE__
    b = Board.new
    b.move_piece("a", [0,0], [0,-1])

end
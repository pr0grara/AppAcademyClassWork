require_relative "piece"

class Board
    def initialize
        @grid = Array.new(8){ |i| Array.new(8) {|j| NullPiece.new([i,j])}}
        p @grid
        # rook_array = [[0,0], [0,7], [7,0], [7,7]]
        # knight_array = [[0,1], [0,6], [7,1], [7,6]]
        # bishop_array = [[0,2], [0,5], [7,2], [7,5]]
        # king_array = [[0,3], [7,3]]
        # queen_array = [[0,4], [7,4]]
        # rook_array.each { |pos| @grid[pos[0]][pos[1]] = Piece.new(pos) }
        # knight_array.each { |pos| @grid[pos[0]][pos[1]] = Piece.new(pos) }
        # bishop_array.each { |pos| @grid[pos[0]][pos[1]] = Piece.new(pos) }
        # king_array.each { |pos| @grid[pos[0]][pos[1]] = Piece.new(pos) }
        # queen_array.each { |pos| @grid[pos[0]][pos[1]] = Piece.new(pos) }
        # @grid[1].each { |col| col = Piece.new([1, col]) }
        # @grid[6].each { |col| col = Piece.new([6, col]) }
        # (2..5).each do |row|
        #   row.each do |col|
        #     @grid[row][col] = Piece.new([row,col])
        #   end
        # end
    end

    def move_piece(start_pos, end_pos)
        
        piece = @grid[start_pos[0]][start_pos[1]]
        @grid[end_pos[0]][end_pos[1]] = piece
    end
end
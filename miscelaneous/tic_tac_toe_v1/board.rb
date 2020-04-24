class Board


    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid_position?(pos)
        pos.all? {|num| num < 3 && num >= 0}
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos, mark)
        @grid[pos[0]][pos[1]] = mark 
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.any? {|row| row.uniq.length == 1 && row[0] == mark}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.uniq.length == 1 && col[0] == mark}
    end

    def win_dia?(mark) 
        i = 0
        dia = []
        while i < @grid.length
            dia << @grid[i][i] 
            i += 1
        end
        return true if dia.uniq.length == 1 && dia[0] == mark
        i = 0
        dia = []
        while i < @grid.length
            dia << @grid.reverse[i][i] 
            i += 1
        end
        return true if dia.uniq.length == 1 && dia[0] == mark
        return false
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_dia?(mark)
        false
    end

    def empty_positions?
        @grid.flatten.any?("_")
    end

end

# board = Board.new
# # p board
# # arr = [2, -1]
# # p board.valid_position?(arr)
# p board.empty?([1,1])
# board.print
# board.place_mark([0,0], "X")
# board.print
# p board.win_row?
# p board.win_col?
# p board.win_dia?
# p board.empty_positions?
# #p board.empty?([3,1])
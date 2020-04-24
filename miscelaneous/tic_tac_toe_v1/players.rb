require_relative "game.rb"
require_relative "board.rb"


class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        nums = ("0".."9")
        puts "Choose your position #{mark}!"
        pos = gets.chomp.split.select { |str| nums.include?(str) }.map {|str| str.to_i}
        return pos if pos.length == 2
        puts 'Please enter valid position'
        get_position
    end

end

# player = HumanPlayer.new("X")
# p player.get_position
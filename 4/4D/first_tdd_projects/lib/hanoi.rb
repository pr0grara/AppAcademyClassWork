require 'byebug'

class Hanoi
  attr_accessor :towers

  def initialize
    @towers = [[5,4,3,2,1], [], []]
  end

  def play
    until won?
      print_towers
      puts "Enter a tower a choose from, followed by a tower to place into"
      input = gets.chomp.split.map(&:to_i)
      move(input)
    end
    puts "Congratulations!"
  end

  def move(tow)
    #debugger
    idx1, idx2 = tow
    raise "First choice was empty tower" if towers[idx1].empty?
    raise "Improper move" if towers[idx1][-1] > towers[idx2][-1] unless towers[idx2].empty?
    
    towers[idx2] << towers[idx1].pop
    towers
  end

  def won?
    new_towers = towers.dup
    new_towers.shift
    return true if new_towers.any? { |tower| tower ==[5,4,3,2,1]}
    false
  end

  def print_towers
    @towers.each {|tower| p tower}
  end
end

if $PROGRAM_NAME == __FILE__
    h = Hanoi.new
    h.play

end
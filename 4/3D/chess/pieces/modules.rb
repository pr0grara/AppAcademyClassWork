require 'byebug'

module Stepable
  def moves
    moves_arr = []
    move_diffs.each do |diff|
      new_pos = [self.pos[0]+diff[0], self.pos[1]+diff[1]]
      moves_arr << new_pos #if board.valid_pos?(new_pos)
    end
    moves_arr
  end

end

module Slideable
  def moves
    moves_arr = []
    move_dirs.each do |dir|
      mod_dir = dir.dup
      #debugger
      until self.pos[0] + mod_dir[0] < 0 || self.pos[0] + mod_dir[0] > 7 ||
            self.pos[1] + mod_dir[1] < 0 || self.pos[1] + mod_dir[1] > 7
              moves_arr << [self.pos[0] + mod_dir[0], self.pos[1] + mod_dir[1]]
              (0..1).each {|i| mod_dir[i] += dir[i]}
      end
    end
    moves_arr
  end
end

module Singleton
end

require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder

  attr_reader :considered_positions

  def initialize(pos) 
    @start = PolyTreeNode.new(pos) 
    @considered_positions = [pos] 
    self.build_move_tree
  end


  def self.valid_moves(pos)
    return false if pos.any? {|num| num < 0 || num > 7}
    true
  end

  def build_move_tree

    queue = [@start]
    
      until queue.empty?
        node = queue.shift
        possible_moves = new_move_position(node.value)
        
        possible_moves.each do |pos|
          new_child = PolyTreeNode.new(pos)
          node.add_child(new_child)
        end
        
        node.children.each {|child| queue << child}
    
      end
  end

  def new_move_position(pos)
    possible_moves = [[2,1], [1,2], [-1,2], [-2,1], [-2,-1], [-1,-2], [2,-1]]
    outcomes = []
    possible_moves.each do |move|
      x = pos[0] + move[0]
      y = pos[1] + move[1]
      outcomes << [x,y] if KnightPathFinder.valid_moves([x,y]) && !@considered_positions.include?([x,y]) 
    end
    @considered_positions += outcomes
    outcomes 
  end

  def find_path(end_pos)
    p trace_path_back(@start.bfs(end_pos))
  end

  def trace_path_back(node)
    path = []
     
    until node.parent.nil?
      path.unshift(node.value)
      node = node.parent
    end
    path.unshift(node.value)
    path
  end

end
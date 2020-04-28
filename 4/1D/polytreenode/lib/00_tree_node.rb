require 'byebug'

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if @parent == nil
            @parent = node 
        else
            @parent.children.delete(self)
            @parent = node
        end

        node.children << self unless node == nil
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise 'Node is not a child' if child.parent == nil
        child.parent = nil
    end

    def dfs(value)
        return self if self.value == value
        
        self.children.each do |child| 
            result = child.dfs(value)
            return result unless result == nil
        end

        nil
    end

      def bfs(value)      
        queue = [self]

        until queue.empty?
            node = queue.shift
            return node if node.value == value
            node.children.each {|child| queue << child}
        end
        nil
    end

end
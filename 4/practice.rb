require 'byebug'

class GraphNode
  attr_reader :name, :neighbors

  def initialize(name)
    @name = name
    @neighbors = []
  end

  def neighbors=(node)
    @neighbors += node
  end

  def print
    puts
    puts "node #{name}'s neighbors:"
    @neighbors.each {|node| puts node } 
  end

  def self.bfs(start_node, target)
    queue = start_node.neighbors
    checker = []

    until queue.empty?
      node = queue.shift
      p node.name
      return node.object_id if node.name == target
      if checker.include?(node)
        queue += node.neighbors
        checker << node
      end
    end
    nil
  end
end


# nodes = [
# a = GraphNode.new('a'),
# b = GraphNode.new('b'),
# c = GraphNode.new('c'),
# d = GraphNode.new('d'),
# e = GraphNode.new('e'),
# f = GraphNode.new('f')
# ]

# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]

# nodes.each {|node| node.print}
# p GraphNode.bfs(a, "c")

class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    add_manager
  end

  def add_manager
    self.boss.add_employees(self) unless self.boss.nil?
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees

  def initialize(name, title, salary, boss=nil)
    super
    @employees = []
  end

  def add_employees(emp) 
    @employees << emp
  end

  def bonus(multiplier)
    emps = self.employees
    checker = []
    finished = false
    
    until finished
      finished = true
      emps.each do |emp|
        if emp.is_a?(Manager) && !checker.include?(emp)
          emps += emp.employees
          checker << emp
          finished = false
        end
      end
    end

    emps.map {|emp| emp.salary}.sum * multiplier
  end
end

ned = Manager.new("Ned", "CEO", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

# p ned.employees
# p darren.employees
 #david.add_manager
#p darren.employees
#darren.add_manager


class Employee
    def initialize(name, title, salary, boss=nil)
        @name, @title, @salary, @boss = name, title, salary, boss
        
    end

    def bonus(multiplier)
        self.salary * multiplier
    end

    attr_reader :salary
end

class Manager < Employee
    def initialize(name, title, salary, boss)
      @employees = Array.new
      super
    end

    def add_employee(emp)
      self.employees << emp
    end

    def bonus(multiplier)
        net_salaries = self.employees.inject(0) {|total, emp| total + emp.salary}
        net_salaries * multiplier
    end

    attr_reader :employees
end
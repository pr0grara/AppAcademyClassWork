
require "byebug"

def tribonacci_number(num)
    if num == 1
        return 1
    elsif num == 2
        return 1
    end
    
    i = 3
    base = [1,1,2]
    while i < num
        base << base.sum
        base.shift
        i += 1
    end
    base[-1]
end




p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7   [1,1,2,4]
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
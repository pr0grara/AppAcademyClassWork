
def factors(num)
    count = 0 
    (1..num).each do |i| 
        count += 1 if num % i == 0 
    end 
    count 
end 

def anti_prime?(num) 
    arr = [] 
     
    (1..num).each do |i| 
       arr << factors(i) 

    end 
    arr.sort[-1] == arr[-1]  
end 

p anti_prime?(24)   # true  
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
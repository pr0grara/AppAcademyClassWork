

def mutual_factors(*num)
    factors = Hash.new(0)
    res = []

     
     num.each do |n| 
       (1..n).each {|i| factors[i] += 1 if n % i == 0}
     end 

    factors.each do |k,v| 
      if v == num.length  
         res << k
      end 
    end 
    res
end 


p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
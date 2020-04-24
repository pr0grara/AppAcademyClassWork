require "prime"

def mersenne_prime(num)
    powers = []
    (1..32).each do |i|
        powers << 2**i
    end
    #powers
    powers.select {|num| (num-1).prime?}[num-1] - 1
end

def is_prime(num)
    (2...num).each {|n| return false if num % n == 0 }
    true
end



p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
p mersenne_prime(8) # 2147483647 8!!! is the limit, with current efficiency (9) sends my computer to hell and back!
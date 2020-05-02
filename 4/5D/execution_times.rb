
def my_min(arr)
    sorted = false

    until sorted 
        sorted = true
        i = 0
        while i < arr.size - 1
            if arr[i] > arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
            i += 1
        end
    end

    arr[0]
end   # => 8n => O(n^2) with 0(n) memory

# Using quick sort will be a way to get O(n^2)

def my_min_inject(arr)
    lower = arr.shift

    (0...arr.length).each do |i|
      if arr[i] < lower
        lower = arr[i] 
      end
    end

    lower
end # O(n) with O(1) memory       #Ask TA when we get the chance

# list = [ 0, 3, 5, 4, -5, 10, 40, 90 ]
#     my_min(list)  # =>  -5

#p my_min_inject(list)



# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the 
#largest contiguous (together in sequence) sub-sum. 
#Find the sums of all contiguous sub-arrays and return the max.

def largest_contiguous_sub_sum(arr)
  subs = []

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      subs << arr[i..j]
    end
  end

  sums = []

  subs.each do |sub|
    temp = []
    sub.each do |num|
      temp << num
    end
    sums << temp.sum
  end

  sums.sort[-1]
end

def better_largest_contiguous_sub_sum_with_worst_name(arr)
    max = arr.first
    curr = arr.first
    (1...arr.size).each do |i|
      curr += arr[i]
      if curr > max 
        max = curr
      elsif curr < 0
        curr = 0
      end
    end
    max
end


list = [1, 2, -4, 4, -3, 4]
# [1, 3, -1, 3, 0, 4]
# [1, 3, 0, 4, 1, 5]
# max = [1, 3, 3, 4, 4, 5]

# (1..arr.size).each do |i| 
#         curr = []
#         arr.each_cons(i) {|a| curr << a.sum}
#         max = curr.max if curr.max > max
#     end


#list = [5, 3, -7]
# p largest_contiguous_sub_sum(list)
p better_largest_contiguous_sub_sum_with_worst_name(list)
#     largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
require 'byebug'
# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
# or `Array#member` methods in your implementation.**

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?
  mid = arr.size/2

  left = arr.take(mid)
  right = arr.drop(mid+1)
  case arr[mid] <=> target
  when 0 
    return mid
  when 1
    binary_search(left, target)
  else
    result = binary_search(right, target)
    result.nil? ? nil : result + mid + 1
  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
      self.each.with_index do |num, j| 
      i = 0
      while i < size
      pairs << [j,i] if i > j && (self[i] + self[j] == target)
      #pairs << [j,i] if i > j && self[i] + self[j] == target
      i += 1
      end
    end
    pairs
  end
end


# i = 0
#     while i < size
#       j = 0
#       while j < size
#         if self[i] + self[j] == 0
#           pairs << [i,j] 
#           self.delete_at(i)
#           self.delete_at(j)
#           break
#         j += 1
#         end
#       end
#       i += 1
#     end

# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  facs = factorials_rec(num-1)
  facs << (num-1) * facs[-1]
end

class String
  # Write a `String#shuffled_sentence_detector(other_string)` method that 
  # returns true if the words in the string can be rearranged to form the 
  # sentence passed as an argument. Words are separated by spaces.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other_string)
    #debugger
    return false if self.split.size != other_string.split.size
    self.split.each do |word|
      return false unless other_string.include?(word)
    end
    true
  end
end

# Write a method that returns the largest prime factor of a number. You may wish
# to write a `prime?(num)` helper method.

def largest_prime_factor(num)
  primes = []
  (2..num).each {|n| primes << n if prime?(n) && num % n == 0}
  primes.sort[-1]
end

def prime?(num)
  (2...num).to_a.none? {|n| num % n == 0 } 
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < size
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_map` method that returns an array made up of the
  # elements in the array after being passed through the given block.
  # **Do NOT use the built-in `Array#map` method in your implementation.**

  def my_map(&prc)
    mapped = []
    self.each {|el| mapped << prc.call(el)}
    mapped
  end
end


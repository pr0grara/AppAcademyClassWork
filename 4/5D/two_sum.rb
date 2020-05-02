

def bad_two_sum?(arr, target)
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end


arr = [1,2,4,6,3,5,7,6,433,445,656,57,56,45,64,557,56,43,32,4,56,43,5,456,43,647,4,5,567,567]
# p bad_two_sum?(arr, 8)
# p bad_two_sum?(arr, 65)

def proper_two_sum?(arr, target)
#   (0...arr.length).each do |i|
#     (i+1...arr.length).each do |j|
#       return true if arr[i] + arr[j] == target
#     end
#   end
#   false
    arr.sort
    (0...arr.length - 1).each {|i| return true if arr[i] + arr[i+1] == target}
    false
end

arr = [1,2,4,6,3,5,7,6,433,445,656,57,56,45,64,557,56,43,32,4,56,43,5,456,43,647,4,5,567,567]
p proper_two_sum?(arr, 8)
p proper_two_sum?(arr, 65)
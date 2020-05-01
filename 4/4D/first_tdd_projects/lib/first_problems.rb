def my_uniq(arr)
    raise "Not an array" unless arr.is_a?(Array)
    new_arr = []
    arr.each { |el| new_arr << el unless new_arr.include?(el)}
    new_arr
end

def two_sum(arr)
  indices = []
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      indices << [i, j] if arr[i] + arr[j] == 0
    end
  end
  indices
end

def my_transpose(arr)
  results = []
  (0...arr.length).each do |i|
    temp = []
    (0...arr.length).each do |j|
      temp << arr[j][i]
    end
    results << temp
  end
  results
end

def my_stock_broker(arr)
    indices = []
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
            indices << [i, j]
        end
    end
    indices.max { |a,b| arr[a[1]] - arr[a[0]] <=> arr[b[1]] - arr[b[0]]}
end
def squaragonal?(array) 
    arr = Array.new(2) {[]}

    (0...array.length).each do |i|
        arr[0] << array[i][i]   
        arr[1] << array.reverse[i][i] 
    end

    return true if arr[0].uniq.length == 1 || arr[1].uniq.length == 1
    false
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
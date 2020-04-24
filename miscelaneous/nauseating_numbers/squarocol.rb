def squarocol?(arr)
    hash_row = Hash.new {|h, k| h[k] = []}
    hash_col = Hash.new {|h, k| h[k] = []}
    arr_col = []

    (0...arr.length).each do |i|
        j = 0
        temp = []
        while j < arr.length
            temp << arr[j][i]
            j += 1
        end
        arr_col << temp
    end

    (0...arr.length).each do |i|
        arr[i].each { |el| hash_row[i] << el }
        arr_col[i].each { |el| hash_col[i] << el }
    end

    (0..arr.length).each {|i| return true if hash_row[i].uniq.length == 1 || hash_col[i].uniq.length == 1}
    false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
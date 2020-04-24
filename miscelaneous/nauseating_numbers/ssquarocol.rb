
def squarocol?(arr)
    
    i = 0
  
    while i < arr.length
        row = arr[i]   #  row 
        j = 0
        while j < row.length  # ele 
           if row.uniq.length == 1 
              return true 
          end 
            j += 1
        end
        i += 1
    end

    arr.each.with_index do |row1, idx1| 
      arr.each.with_index do |row2, idx2| 
         if idx1 < idx2 
          j = 0 
          while j < row1.length 
              if row1[j] == row2[j] 
                return true 
              end 
            end 
          end 
            i += 1 
        end 
      end 
     
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
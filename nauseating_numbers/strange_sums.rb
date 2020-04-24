


def strange_sums(arr)
    counter = 0 

     arr.each.with_index do |n1, i1| 
        arr.each.with_index do |n2,i2|
            if i1 < i2 && n1 + n2 == 0 
                counter += 1 
            end  
        end 
    end 

    #arr.sort.each_with_index {|num, i| arr[i] = 0if num + arr.sort[i+1] == 0}
    counter   
end 

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
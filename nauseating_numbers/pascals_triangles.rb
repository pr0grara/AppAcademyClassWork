require "byebug"

def pascals_triangle(num)
    arr = [[1], [1,1], [1,2,1]]

    # arr << [1] if arr[-1] == nil
    # arr.push([1, 1]) if arr[-1].length == 1
    
   # i = 1
    
    #while i < num
        j = 0
        temp = [1,2,1]
            while temp.length <= arr[-1].length 
                temp << arr[-1][j] + arr[-1][j + 1]
            j += 1
            arr << temp
            end
        #i += 1
    #end
    
    
    arr
    
end
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
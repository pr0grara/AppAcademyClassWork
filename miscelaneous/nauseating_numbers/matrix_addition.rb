
require "byebug"
def matrix_addition(arr1, arr2)
    result = []
    i = 0
    
    while i < arr1.length
        j = 0
        temp = []
        while j < arr1[0].length
            temp << (arr1[i][j] + arr2[i][j])
            j += 1
        end
        result << temp
        i += 1 
    end 

    result 
end


# def matrix_addition(arr1, arr2) 
#     result = []
#     res = []

#     array1 = arr1.flatten
#     array2 = arr2.flatten 

#            array1.each.with_index do |n1,i1|
#            array2.each.with_index do |n2,i2| 
      
#              if i1 == i2 
          
#              res << n1 + n2
#            end
#           end 
#         end 
#      result  << res  
#     return result 
# end 




matrix_a = [[2,5], [4,7]]  
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
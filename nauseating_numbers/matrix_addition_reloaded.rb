
def  matrix_addition_reloaded(*arr) #[[[2,5],[4,7]],  [[9,1], [3,0]]]
      res = []
      i = 0 

      return nil if (arr.flatten.length % arr.length != 0)

      while i < arr[0].length  #4 
           j = 0 
           tmp = [] 

            while j < arr[0][0].length  # j = [2,5]
                k = 0      # k access [0][[[2,5],[4,7]]    [1] [[9,1], [3,0]]] 
                temp_key = 0
                while k < arr.length
                temp_key += arr[k][i][j] 
                k += 1
                end
             tmp << temp_key   
             j += 1 
            end 
        res << tmp 
        i += 1 
    end 
    res 
end  


matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
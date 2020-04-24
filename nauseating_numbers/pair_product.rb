
def pair_product(arr, num)
    
    arr.each.with_index do |n1, i1|
        arr.each.with_index do |n2, i2|
            return true if n1 * n2 == num && i1 < i2
        end
    end
    false
end








p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false



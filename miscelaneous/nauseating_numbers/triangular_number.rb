
#(i * (i + 1)) / 2

def triangular_word?(str)
    indices = []
    alpha = ("a".."z").to_a

    alpha
    
end




p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false


def rampant_repeats(str, hash)
      new_str = ''

      str.each_char do |char| 
        if hash.has_key?(char) 
            hash[char].times {new_str += char}     
        else 
            new_str += char  
        end 
    end
    new_str
end 

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'





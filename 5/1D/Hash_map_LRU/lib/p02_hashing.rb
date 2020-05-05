class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    our_hash = 0
    self.each_with_index do |ele, i|
      self[i + 1].nil? ? mod_num = ele + self[i - 1] : mod_num = ele + self[i + 1]
      our_hash += (self.size % mod_num)
    end
    our_hash
  end
end

class String
  def hash
    our_hash = self.bytes
    our_hash.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    our_hash = self.keys.sort + self.values.sort
    result = []
    our_hash.flatten.each do |ele|
      result << ele if ele.is_a?(Integer)
      ele = ele.to_s if ele.is_a?(Symbol)
      new_ele = ele.bytes unless ele.is_a?(Integer)
      result << new_ele.join unless new_ele.nil?
    end
    result.join.to_i
  end
end

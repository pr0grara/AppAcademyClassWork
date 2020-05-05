class HashSet
  attr_reader :count
  attr_writer :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= @store.size
    id = key.hash
    @count += 1
    @store[id % @store.size] << key
  end

  def include?(key)
    id = key.hash
    @store[id % @store.size].include?(key)
  end

  def remove(key)
    if include?(key)
      id = key.hash
      @count -= 1
      @store[id % @store.size].delete(key) 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(@store.size*2) { Array.new }
    @count = 0
    temp.flatten.each do |ele|
      insert(ele)
    end
  end
end

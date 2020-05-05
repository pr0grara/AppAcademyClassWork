require 'byebug'

class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless num.between?(0, @store.length - 1)
    @store[num] = true
  end

  def remove(num)
    raise 'Out of bounds' unless num.between?(0, @store.length - 1)
    @store[num] = false
  end

  def include?(num)
    if num.between?(0, @store.length-1) 
      @store[num]
    else
      return false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % store.size] << num
  end

  def remove(num)
    @store[num % store.size].delete(num)
  end

  def include?(num)
    store[num % store.size].any?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless @store[num % store.size].include?(num) && @count <= @store.size
      @store[num % store.size] << num
      @count += 1
    end
    if @count >= @store.size
      resize!
    end
  end

  def remove(num)
    if @store[num % store.size].include?(num)
      @store[num % store.size].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % store.size].any?(num)
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

module Enumerables
  
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
      i = 0
      arr = self.to_a
      while i < arr.length
        yield(arr[i], i)
        i += 1
      end
    arr 
  end

end
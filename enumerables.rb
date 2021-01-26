module Enumerable

  def my_each
    return to_enum(:my_each) unless block_given?
      i = 0
      while i < self.length
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

  def my_select
    return to_enum(:my_select) unless block_given?
      i = []
      my_each do |value|
        if yield(value)
          i.push(value)
        end
      end
    i
  end

  def my_all?
    my_each do |value|
      if yield(value) != true
        return false
      end
    return true
    end
  end

  def my_any?
    my_each do |value|
      if yield(value) != false
        return true
      end
    return false
    end
  end

  def my_none?
    my_each do |value|
      if yield(value) != true
        return true
      end
    return false
    end
  end

  def my_count(arg = nil)
    counter = 0
    if block_given?
      self.my_each {|x| counter += 1 if yield(x)}
    elsif !block_given? && arg.nil?
      counter = self.length
    else
      counter = self.my_select {|x| x == arg}.length
    end
    return counter
  end

  def my_map(&my_proc)
    arr = []
    self.my_each do |value|
      if my_proc.nil?
        arr.push(my_proc.call(value))        
      else
        arr.push(yield(value))
      end
    end
    return arr
  end

  def my_inject(inject=self[0])
    self.my_each_with_index do |value, index|
      inject = yield(inject, value) if index > 0
    end
    return inject
  end
end

def multiply_els(arr)
  arr.my_inject{|total, n| total*n}
end

arr = [1, 6, 2, 4, 3, 2]
puts arr.my_count
puts arr.my_count(2)
puts (arr.my_count{|x| x%2==0})
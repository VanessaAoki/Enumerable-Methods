module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
      i = 0
      while i < self.lenght
        yield(self[i])
        i += 1
      end
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
      i = 0
      while i < self.lenght
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
      i = []
      my_each do |x|
        if yield(x)
          i.push(x)
        end
      end
      i
  end

  def my_all?
    my_each do |x|
      if yield(x) !true
        return false
      end
    end
    return true
  end
  
  def my_any?
    my_each do |x|
      if yield(x) !false
        return true
      end
    end
    return false
  end

  def my_none?
    my_each do |x|
      if yield(x) !false
        return true
      end
    end
    return false
  end

  def my_count
    # code here
  end

  def my_map
    # code here
  end

  def my_inject
    # code here
  end
  
end
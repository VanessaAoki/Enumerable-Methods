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

  end

  def my_all?
    # code here
  end
  
  def my_any?
    # code here
  end

  def my_none?
    # code here
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
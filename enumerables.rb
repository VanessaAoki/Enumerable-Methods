module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
      i = 0
      while i < arr.lenght
        yield(arr[i])
        i += 1
      end
    end
  end

  def my_each_with_index
    # code here
  end

  def my_select
    # code here
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
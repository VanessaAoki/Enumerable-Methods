module Enumerable

  def my_each
    return to_enum(:my_each) unless block_given?

      i = 0
      while i < to_a.length
        yield(to_a[i])
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

  def my_all?(arg = nil)
    if block_given?
      self.my_each {|value| return false if yield(value) != true}
    elsif arg.nil?
      self.my_each {|value| return false if value.nil? || value == false}
    elsif !arg.nil? && (arg.is_a? Class)
      self.my_each {|value| return false unless [value.class, value.class.superclass].include?(arg)}
    elsif !arg.nil? && arg.class == Regexp
      self.my_each {|value| return false unless arg.match(value)}
    else
      self.my_each {|value| return false if value != arg}
    end
    return true
  end

  def my_any?(arg = nil)
    if block_given?
      self.my_each {|value| return true if yield(value)}
    elsif arg.nil?
      self.my_each {|value| return true if value}
    elsif !arg.nil? && (arg.is_a? Class)
      self.my_each {|value| return true if [value.class, value.class.superclass].include?(arg)}
    elsif !arg.nil? && arg.class == Regexp
      self.my_each {|value| return true if arg.match(value)}
    else
      self.my_each {|value| return true if value == arg}
    end
    return false
  end

  def my_none?(arg = nil)
    if block_given?
      !my_any?(&Proc.new)
    else
      !my_any?(arg)
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

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given? || proc != nil

    arr = []
    if proc != nil
      self.my_each {|value| arr << proc.call(value)}
    else
      self.my_each {|value| arr << yield(value)}
    end
    return arr
  end

  def my_inject(total = nil, n = nil)
    if total.is_a?(Symbol)
      n = total
      total = nil
    end

    if !block_given? && !n.nil?
      self.my_each{|value| total = total.nil? ? value : total.send(n, value)}
    else
      self.my_each{|value| total = total.nil? ? value : yield(total, value)}
    end
    return total
  end
end

def multiply_els(arr)
  arr.my_inject{|total, n| total * n}
end
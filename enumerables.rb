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
    arr = to_a
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
      i.push(value) if yield(value)
    end
    i
  end

  def my_all?(arg = nil)
    if block_given?
      my_each { |value| return false if yield(value) != true }
    elsif arg.nil?
      my_each { |value| return false if value.nil? || value == false }
    elsif !arg.nil? && (arg.is_a? Class)
      my_each { |value| return false unless [value.class, value.class.superclass].include?(arg) }
    elsif !arg.nil? && arg.class == Regexp
      my_each { |value| return false unless arg.match(value) }
    else
      my_each { |value| return false if value != arg }
    end
    true
  end

  def my_any?(arg = nil)
    if block_given?
      my_each { |value| return true if yield(value) }
    elsif arg.nil?
      my_each { |value| return true if value }
    elsif !arg.nil? && (arg.is_a? Class)
      my_each { |value| return true if [value.class, value.class.superclass].include?(arg) }
    elsif !arg.nil? && arg.class == Regexp
      my_each { |value| return true if arg.match(value) }
    else
      my_each { |value| return true if value == arg }
    end
    false
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
      my_each { |x| counter += 1 if yield(x) }
    elsif !block_given? && arg.nil?
      counter = length
    else
      counter = my_select { |x| x == arg }.length
    end
    counter
  end

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given? || !proc.nil?

    arr = []
    if !proc.nil?
      my_each { |value| arr << proc.call(value) }
    else
      my_each { |value| arr << yield(value) }
    end
    arr
  end

  def my_inject(total = nil, n = nil)
    if total.is_a?(Symbol)
      n = total
      total = nil
    end

    if !block_given? && !n.nil?
      my_each { |value| total = total.nil? ? value : total.send(n, value) }
    else
      my_each { |value| total = total.nil? ? value : yield(total, value) }
    end
    total
  end
end

def multiply_els(arr)
  arr.my_inject { |total, n| total * n }
end

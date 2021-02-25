require_relative '../enumerables'

describe Enumerable do
  let(:array) { %w[ruby test rspec] }
  let(:numbers) { [1, 2, 3, 4, 5, 6, 7, 8] }
  let(:falsearray) { [false, false, false] }
  describe '#my_each' do
    it 'return all the elements in the array' do
      expect(array.my_each).to include 'ruby'
    end

    it 'if no block is given, returns an enumerator' do
      expect(array.my_each) == array.to_enum
    end
  end

  describe '#my_each_with_index' do
    it 'if no block is given, returns an enumerator' do
      expect(array.my_each_with_index) == array.to_enum
    end

    it 'return all the elements with index' do
      expect(array.my_each_with_index { |elem, index| puts elem, index }).to eql(%w[ruby test rspec])
    end
  end

  describe '#my_select' do
    it 'if no block is given, returns an enumerator' do
      expect(array.my_select) == array.to_enum
    end

    it 'return an array with all the elements that match the yield' do
      expect(numbers.my_select(&:even?)).to eql([2, 4, 6, 8])
    end
  end

  describe '#my_all?' do
    it 'returns true if no block is given and none of the elements is nil' do
      expect(array.my_all?).to eql(true)
    end

    it 'returns true if the block never returns false or nil' do
      expect(array.my_all? { |word| word.length >= 4 }).to eql(true)
    end

    it 'returns false if one or more elements return false' do
      expect(array.my_all? { |word| word.length >= 5 }).to eql(false)
    end

    it 'returns true if all elements are the same data type' do
      expect(array.my_all?(String)).to eql(true)
    end

    it 'returns true if the array is empty' do
      expect([].my_all?).to eql(true)
    end
  end

  describe '#my_any?' do
    it 'returns true if no block is given and if 1 of the elements is nil or false from the list' do
      expect(array.my_any?).to eql(true)
    end

    it 'returns true if at least one of the elements returns true' do
      expect(array.my_any? { |word| word.length >= 4 }).to eql(true)
    end

    it 'returns false if all elements return false' do
      expect(array.my_any? { |word| word.length >= 6 }).to eql(false)
    end

    it 'returns true if at least one element is the same data type' do
      expect(array.my_any?(String)).to eql(true)
    end

    it 'returns false if the array is empty' do
      expect([].my_any?).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'returns true if no block is given and if all of the elements are nil or false from the list' do
      expect(falsearray.my_none?).to eql(true)
    end

    it "returns true if it's never true" do
      expect(array.my_none? { |word| word.length >= 6 }).to eql(true)
    end

    it 'returns false if at least one return true' do
      expect(array.my_none? { |word| word.length >= 4 }).to eql(false)
    end

    it 'returns false if at least one element is the same data type' do
      expect(array.my_none?(String)).to eql(false)
    end

    it 'returns true if the array is empty' do
      expect([].my_none?).to eql(true)
    end
  end

  describe '#my_count' do
    it 'returns the number of elements' do
      expect(numbers.my_count).to eql(8)
    end

    it 'returns the number of elements that are equal to the given argument' do
      expect(numbers.my_count(2)).to eql(1)
    end

    it 'returns the number of elements that matches the block' do
      expect(numbers.my_count(&:even?)).to eql(4)
    end
  end

  describe '#my_map' do
    it 'returns a new array with the results of running block once for every element in enum' do
      expect([1, 2, 3, 4].my_map { |i| i + i }).to eql([2, 4, 6, 8])
    end

    it 'if no block is given, returns an enumerator' do
      expect(array.my_map) == array.to_enum
    end
  end

  describe '#my_inject' do
    it 'return the sum of all elements' do
      expect((5..10).my_inject(:+)).to eql(45)
    end

    it 'returns one value from the elements' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
    end

    it 'returns the longest word' do
      expect(array.my_inject do |memo, word|
               memo.length > word.length ? memo : word
             end).to eql('rspec')
    end
  end
end

describe "#multiply_els" do
  let(:test_array) { [1, 2, 3, 4, 5, 6, 7, 8] }
  it "returns the injected array" do
    expect(multiply_els(test_array)).to eql(40320)
  end
end


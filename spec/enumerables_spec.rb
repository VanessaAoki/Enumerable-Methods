require_relative '../enumerables.rb'

array = ["ruby", "test", "rspec"]
numbers = [1, 2, 3, 4, 5, 6, 7, 8]

describe Enumerable do
  describe "#my_each" do
    it "return all the elements in the array" do
      expect(array.my_each).to include "ruby"
    end
    
    it "if no block is given, returns an enumerator" do
      expect(array.my_each) == array.to_enum
    end
  end

  describe "#my_each_with_index" do
    it "if no block is given, returns an enumerator" do
      expect(array.my_each_with_index) == array.to_enum
    end

    it "return all the elements with index" do
      expect(array.my_each_with_index {|elem, index| puts elem, index}).to eql(%w[ruby test rspec])
    end
  end

  describe "#my_select" do
    it "if no block is given, returns an enumerator" do
      expect(array.my_select) == array.to_enum
    end

    it "return an array with all the elements that match the yield" do
      expect(numbers.my_select {|num| num.even?}).to eql([2, 4, 6, 8])
    end
  end

end
require_relative '../enumerables.rb'

describe Enumerable do
  let(:array) {["ruby", "test", "rspec"]}
  let(:numbers) {[1, 2, 3, 4, 5, 6, 7, 8]}

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

  describe "#my_all?" do
    it "returns true if no block is given and none of the elements is nil" do
      expect(array.my_all?).to eql(true)
    end

    it "returns true if the block never returns false or nil" do
      expect(array.my_all? { |word| word.length >= 4 }).to eql(true)
    end

    it "returns false if the block one or more elements return false" do
      expect(array.my_all? { |word| word.length >= 5 }).to eql(false)
    end

    it "returns true if all elements are the same data type" do      
      expect(array.my_all?(String)).to eql(true)
    end

    it "returns true if the array is empty" do
      expect([].my_all?).to eql(true)
    end
  end
end
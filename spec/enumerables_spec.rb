require_relative '../enumerables.rb'

array = ["ruby", "test", "rspec"]

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

    it "return all the elements in the array" do
      expect(array.my_each_with_index).to include "test"
    end

    it "return all the elements with index" do
      expect(array.my_each_with_index {|elem, index| puts elem, index}).to eql(%w[ruby test rspec])
    end
  end


end
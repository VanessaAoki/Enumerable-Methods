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


end
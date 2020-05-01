require 'first_problems.rb'

describe "#my_uniq" do
    it "should take in an array" do
        expect { my_uniq(5) }.to raise_error("Not an array")
    end

    it "should return a unique version of the original array" do
        expect(my_uniq([1, 2, 3, 3])).to eq([1, 2, 3])
    end
end

describe "#two_sum" do
    it "should return an empty array if it receives an empty array" do
      expect(two_sum([])).to eq([])
    end
  
    it "should return index pairs that sum to zero" do
        expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
    end

end

describe "#my_transpose" do
  let(:array_1) {[1,2,3]}
  let(:array_2) {[4,5,6]}
  let(:array_3) {[7,8,9]}
  let(:answer) {[[1,4,7], [2,5,8], [3,6,9]]}

  it "should return a transposed version of the array" do
    expect(my_transpose([array_1, array_2, array_3])).to eq(answer)
  end
end

describe "#my_stock_broker" do
    let(:days) {[2, 4, 8, 1, 5, 3]}

    it "should return the index of the minimum value followed by the maximum value" do
        expect(my_stock_broker(days)).to eq([0, 2])
    end

    it "should return the two indices with the greatest difference" do
        expect(my_stock_broker(days)).to_not eq([3, 4])
    end

end
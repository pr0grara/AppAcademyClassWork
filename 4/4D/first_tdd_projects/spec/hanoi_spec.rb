require "hanoi.rb"

describe "Hanoi" do 
  subject(:hanoi) {Hanoi.new}

  describe "#initialize" do
    it "should have three towers" do
      expect(hanoi.towers.length).to eq(3)
    end

    it "should start all discs in tower 1" do 
      expect(hanoi.towers[0]).to eq([5,4,3,2,1])
    end

    it "should start with no discs in towers 2 and 3" do
      expect(hanoi.towers[1]).to eq([])
      expect(hanoi.towers[2]).to eq([])
    end
  end
  
  describe "#move" do 
    let(:mixed_towers) {[[5,3,2], [4,1], []]}

    it "should not allow picking a plate from an empty tower" do
        expect { hanoi.move([1, 0]) }.to raise_error("First choice was empty tower")
    end
    
    it "should not allow stacking a plate on a smaller plate" do
        hanoi.towers = mixed_towers
        expect { hanoi.move([0, 1]) }.to raise_error("Improper move")
    end

    it "should take a plate from one tower and place it on top of another tower" do
        expect(hanoi.move([0, 1])).to eq([[5,4,3,2], [1], []])
    end


  end

  describe "#won" do
    let(:finished_tower_1) {[[], [5,4,3,2,1], []]}
    let(:finished_tower_2) {[[], [], [5,4,3,2,1]]}

    it "should return false if tower 1 is not empty or either tower 2 or 3 are not full" do
        expect(hanoi.won?).to eq(false)
    end

    it "should return true if either tower 2 or tower 3 is full" do
        hanoi.towers = finished_tower_1
        expect(hanoi.won?).to eq(true)
        hanoi.towers = finished_tower_2
        expect(hanoi.won?).to eq(true)
    end

  end

end
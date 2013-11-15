require "./lib/hamming"

describe Hamming do
  it "should report no difference between empty strands" do
    expect(Hamming.compute('', '')).to eq 0
  end

  it "should report no difference between matching strands" do
    expect(Hamming.compute('GGACTGA', 'GGACTGA')).to eq 0
  end

  it "should work on short strands" do
    expect(Hamming.compute('ACT', 'GGA')).to eq 3
  end

  it "should report a hamming distance in off-by-1 strands" do
    expect(Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')).to eq 9
  end

  it "should report hamming distance when its in the middle of a strand" do
    expect(Hamming.compute('GGACG', 'GGTCG')).to eq 1
  end

  it "should ignore extra length when working with strands of unequal length" do
    expect(Hamming.compute('AAACTAGGGG', 'AGGCTAGCGGTAGGAC')).to eq 3
  end

  it "should ignore extra length when the original strand is the longer" do
    expect(Hamming.compute('GACTACGGACAGGGTAGGGAAT', 'GACATCGCACACC')).to eq 5
  end
end

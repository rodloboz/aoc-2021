require "spec"
require "../board_array"

describe BoardArray do
  describe "#match" do
    it "matches drawn numbers" do
      board_array = BoardArray.new([22, 13, 17, 11, 0])

      board_array.match(11)

      board_array.unmatched_numbers.should eq([22, 13, 17, 0])
      board_array.completed?.should eq(false)

      board_array.match(22)
      board_array.match(13)
      board_array.match(17)
      board_array.match(0)

      board_array.unmatched_numbers.should eq([] of Int64)
      board_array.completed?.should eq(true)
    end
  end
end

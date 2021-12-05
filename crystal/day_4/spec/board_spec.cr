require "spec"
require "../board"

describe Board do
  describe "#match" do
    it "matches drawn numbers" do
      rows = [
        [14, 21, 17, 24, 4],
        [10, 16, 15, 9, 19],
        [18, 8, 23, 26, 20],
        [22, 11, 13, 6, 5],
        [2, 0, 12, 3, 7]
      ]
      columns = rows.transpose

      board = Board.new(rows, columns)

      board.match(7)
      board.match(4)
      board.match(9)
      board.match(5)
      board.match(11)

      board.locked?.should eq(false)

      board.match(17)
      board.match(23)
      board.match(2)
      board.match(0)
      board.match(14)
      board.match(21)

      board.locked?.should eq(false)

      board.match(24)

      board.locked?.should eq(true)
      board.score.should eq(188)
    end
  end
end

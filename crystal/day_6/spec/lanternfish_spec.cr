require "spec"
require "../lanternfish"

describe "day_6" do
  describe "#school_size" do
    it "returns the number of lanternfish after the given number of days" do
      initial_state = [3, 4, 3, 1, 2]
      days = 256
      school_size(initial_state, days).should eq(26984457539)
    end
  end
end

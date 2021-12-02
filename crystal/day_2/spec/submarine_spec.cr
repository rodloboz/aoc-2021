require "spec"
require "../submarine"

describe "day_2" do
  describe "#calculate_position_and_depth" do
    it "returns the horizontal position and depth after a planner course" do
      inputs = [
        {"forward", 5},
        {"down", 5},
        {"forward", 8},
        {"up", 3},
        {"down", 8},
        {"forward", 2}
      ]

      calculate_position_and_depth(inputs).should eq({"horizontal" => 15, "depth" => 10})
    end
  end

  describe "#advanced_calculate_position_and_depth" do
    it "returns the number of times a depth measurement increases" do
      inputs = [
        {"forward", 5},
        {"down", 5},
        {"forward", 8},
        {"up", 3},
        {"down", 8},
        {"forward", 2}
      ]

      advanced_calculate_position_and_depth(inputs).should eq({"horizontal" => 15, "depth" => 60})
    end
  end
end

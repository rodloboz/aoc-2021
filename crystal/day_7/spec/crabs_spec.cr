require "spec"
require "../crabs"

describe "day_7" do
  describe "#fuel_cost" do
    it "returns total fuel cost to reach the common horizontal position that spends the least fuel" do
      input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
      fuel_cost(input).should eq(37)
    end
  end

  describe "#enhanced_fuel_cost" do
    it "returns total fuel cost to reach the common horizontal position that spends the least fuel" do
      input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]
      enhanced_fuel_cost(input).should eq(168)
    end
  end
end

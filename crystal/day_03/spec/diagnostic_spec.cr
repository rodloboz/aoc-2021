require "spec"
require "../diagnostic"

describe "day_3" do
  describe "#power_consumption" do
    it "returns the power consumption of the submarine" do
      inputs = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
      ]

      power_consumption(inputs).should eq(198)
    end
  end

  describe "#life_support_rating" do
    it "returns the life support rating of the submarine" do
      inputs = [
        "00100",
        "11110",
        "10110",
        "10111",
        "10101",
        "01111",
        "00111",
        "11100",
        "10000",
        "11001",
        "00010",
        "01010"
      ]

      life_support_rating(inputs).should eq(230)
    end
  end
end

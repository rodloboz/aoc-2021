require "spec"
require "../sonar"

describe "day_1" do
  describe "#measurement_increases" do
    it "returns the number of times a depth measurement increases" do
      inputs = [
        199,
        200,
        208,
        210,
        200,
        207,
        240,
        269,
        260,
        263
      ]

      measurement_increases(inputs).should eq 7
    end
  end

  describe "#sliding_window_increases" do
    it "returns the number of times a depth measurement increases" do
      inputs = [
        199,
        200,
        208,
        210,
        200,
        207,
        240,
        269,
        260,
        263
      ]

      sliding_window_increases(inputs).should eq 5
    end
  end
end

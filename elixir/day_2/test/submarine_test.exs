defmodule Day2Test do
  use ExUnit.Case
  doctest Submarine

  test "#calculate_position_and_depth" do
    inputs = [
      {"forward", 5},
      {"down", 5},
      {"forward", 8},
      {"up", 3},
      {"down", 8},
      {"forward", 2}
    ]

    assert Submarine.calculate_position_and_depth(inputs) == %{horizontal: 15, depth: 10}
  end

  test "#advanced_calculate_position_and_depth" do
    inputs = [
      {"forward", 5},
      {"down", 5},
      {"forward", 8},
      {"up", 3},
      {"down", 8},
      {"forward", 2}
    ]

    assert Submarine.advanced_calculate_position_and_depth(inputs) == %{horizontal: 15, depth: 60}
  end
end

defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "#measurement_increases" do
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

    assert Day1.measurement_increases(inputs) == 7
  end

  test "#sliding_window_increases" do
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

    assert Day1.sliding_window_increases(inputs) == 5
  end
end

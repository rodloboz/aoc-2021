defmodule DiagnosticTest do
  use ExUnit.Case
  doctest Diagnostic

  test "power consumption" do
    input = """
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    """

    numbers = Diagnostic.parse_input(input)
    assert Diagnostic.PowerConsumption.calculate(numbers) == 198
  end

  test "life support rating" do
    input = """
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
    """

    numbers = Diagnostic.parse_input(input)
    assert Diagnostic.LifeSupport.calculate(numbers) == 230
  end
end

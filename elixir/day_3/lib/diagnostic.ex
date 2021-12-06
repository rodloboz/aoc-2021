defmodule Diagnostic do
  @moduledoc """
  Documentation for `Diagnostic`.
  """

  @input_data Path.join(__DIR__, "../../../data/day_3/input.txt")

  def run do
    numbers =
      File.read!(@input_data)
      |> parse_input

    result = %{
      power_consumption: Diagnostic.PowerConsumption.calculate(numbers),
      life_support_ratings: Diagnostic.LifeSupport.calculate(numbers)
    }

    IO.inspect(result)
  end

  def parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> String.to_charlist() |> List.to_tuple()))
  end
end

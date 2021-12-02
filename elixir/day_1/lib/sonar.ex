defmodule Sonar do
  @moduledoc """
  Documentation for `Sonar`.
  """

  @measurement_data Path.join(__DIR__, "../../../data/day_1/input.txt")

  def process_inputs do
    result = read_inputs() |> measurement_increases()
    window = read_inputs() |> sliding_window_increases()

    IO.puts("Increases: #{result} | Window: #{window}")
  end

  def measurement_increases(inputs) do
    Sonar.Measurement.count_increases(inputs)
  end

  def sliding_window_increases(inputs) do
    inputs
    |> Enum.drop(-2)
    |> Enum.with_index(0)
    |> Enum.map(fn {input, index} ->
      input + Enum.at(inputs, index + 1) + Enum.at(inputs, index + 2)
    end)
    |> measurement_increases
  end

  defp read_inputs do
    File.read!(@measurement_data)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

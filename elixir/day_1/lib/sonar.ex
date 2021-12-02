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
    inputs
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left, right] -> right > left end)
  end

  def sliding_window_increases(inputs) do
    inputs
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> measurement_increases
  end

  defp read_inputs do
    File.read!(@measurement_data)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

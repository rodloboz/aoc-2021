defmodule Sonar do
  @moduledoc """
  Documentation for `Sonar`.
  """

  @measurement_data Path.join(__DIR__, "../../../data/day_1/input.txt")

  def process_inputs do
    result = read_inputs() |> measurement_increases()

    IO.puts("Increases: #{result}")
  end

  def measurement_increases(inputs) do
    Sonar.Measurement.count_increases(inputs)
  end

  def sliding_window_increases(_inputs) do
    0
  end

  defp read_inputs do
    File.read!(@measurement_data)
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end

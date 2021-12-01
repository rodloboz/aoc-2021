defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def measurement_increases([head | tail], count \\ 0) do
    measurement_increases(head, tail, count)
  end

  def measurement_increases(previous, [head | tail], count) do
    new_count = if head > previous, do: count + 1, else: count

    measurement_increases(head, tail, new_count)
  end

  def measurement_increases(_, [], count) do
    count
  end

  def sliding_window_increases(inputs) do
    Enum.map(inputs, fn x ->
      x * 2
    end)
  end

  defp reduce_inputs([head | tail], sum \\ 0) do
  end
end

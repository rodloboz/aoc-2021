defmodule Sonar.Measurement do
  def count_increases([head | tail], count \\ 0) do
    count_increases(head, tail, count)
  end

  def count_increases(previous, [head | tail], count) do
    new_count = if head > previous, do: count + 1, else: count

    count_increases(head, tail, new_count)
  end

  def count_increases(_, [], count) do
    count
  end
end

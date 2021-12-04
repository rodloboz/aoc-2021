defmodule Diagnostic.LifeSupport do
  def calculate(numbers) do
    o2_generator_rating(numbers) * co2_scrubber_rating(numbers)
  end

  defp o2_generator_rating(numbers) do
    recur(numbers, 0, fn one_count, zero_count ->
      if one_count >= zero_count, do: ?1, else: ?0
    end)
  end

  def co2_scrubber_rating(numbers) do
    recur(numbers, 0, fn one_count, zero_count ->
      if zero_count <= one_count, do: ?0, else: ?1
    end)
  end

  defp recur([number], _pos, _fun) do
    tupple_to_number(number)
  end

  defp recur(numbers, pos, fun) do
    zero_count = Enum.count(numbers, &(elem(&1, pos) == ?0))
    one_count = length(numbers) - zero_count
    to_keep = fun.(one_count, zero_count)
    numbers = Enum.filter(numbers, &(elem(&1, pos) == to_keep))
    recur(numbers, pos + 1, fun)
  end

  defp tupple_to_number(number) do
    number
    |> Tuple.to_list()
    |> List.to_integer(2)
  end
end

defmodule Diagnostic.PowerConsumption do
  import Bitwise

  def calculate(numbers) do
    [sample | _] = numbers
    number_length = tuple_size(sample)
    half = div(length(numbers), 2)

    gamma_rate =
      for pos <- 0..(number_length - 1) do
        zero_count = Enum.count_until(numbers, &(elem(&1, pos) == ?0), half + 1)
        if zero_count > half, do: ?0, else: ?1
      end
      |> List.to_integer(2)

    mask = 2 ** number_length - 1
    epsilon_rate = bnot(gamma_rate) &&& mask

    gamma_rate * epsilon_rate
  end
end

defmodule Sonar.Utils do
  def sum_each_cons_three(list) do
    list
    |> Enum.drop(-2)
    |> Enum.with_index(0)
    |> Enum.map(fn {input, index} ->
      input + Enum.at(list, index + 1) + Enum.at(list, index + 2)
    end)
  end
end

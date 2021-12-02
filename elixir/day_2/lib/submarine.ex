defmodule Submarine do
  @moduledoc """
  Documentation for `Submarine`.
  """

  @measurement_data Path.join(__DIR__, "../../../data/day_2/input.txt")

  def process_inputs do
    coordinates = read_inputs() |> calculate_position_and_depth()
    position = coordinates.depth * coordinates.horizontal

    IO.puts(
      "Horizontal: #{coordinates.horizontal} | Depth: #{coordinates.depth} | Result: #{position}"
    )

    coordinates_adv = read_inputs() |> advanced_calculate_position_and_depth()
    position_adv = coordinates_adv.depth * coordinates_adv.horizontal

    IO.puts(
      "Horizontal: #{coordinates_adv.horizontal} | Depth: #{coordinates_adv.depth} | Result: #{position_adv}"
    )
  end

  def calculate_position_and_depth(inputs) do
    Enum.reduce(inputs, %{horizontal: 0, depth: 0}, fn {command, value}, map ->
      case command do
        "forward" ->
          Map.put(map, :horizontal, map.horizontal + value)

        "down" ->
          Map.put(map, :depth, map.depth + value)

        "up" ->
          Map.put(map, :depth, map.depth - value)
      end
    end)
  end

  def advanced_calculate_position_and_depth(inputs) do
    Enum.reduce(inputs, %{horizontal: 0, depth: 0, aim: 0}, fn {command, value}, map ->
      case command do
        "forward" ->
          Map.merge(map, %{
            horizontal: map.horizontal + value,
            depth: map.depth + map.aim * value
          })

        "down" ->
          Map.put(map, :aim, map.aim + value)

        "up" ->
          Map.put(map, :aim, map.aim - value)
      end
    end)
    |> Map.drop([:aim])
  end

  defp read_inputs do
    File.read!(@measurement_data)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [command, value] = String.split(line, " ")
      {command, String.to_integer(value)}
    end)
  end
end

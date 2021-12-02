defmodule Submarine do
  @moduledoc """
  Documentation for `Submarine`.
  """

  def calculate_position_and_depth(inputs) do
    coordinates = %{horizontal: 0, depth: 0}

    for {command, value} <- inputs do
      case command do
        "forward" ->
          coordinates = Map.put(coordinates, :horizontal, coordinates.horizontal + value)

        "down" ->
          coordinates = Map.put(coordinates, :depth, coordinates.depth + value)

        "up" ->
          coordinates = Map.put(coordinates, :depth, coordinates.depth - value)
      end
    end

    coordinates
  end
end

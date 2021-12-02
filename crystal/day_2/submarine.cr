# frozen_string_literal: true

FORWARD = "forward"
DOWN = "down"
UP = "up"

def calculate_position_and_depth(inputs : Array({String,Int32}))
  coordinates = { "horizontal" => 0, "depth" => 0 }

  inputs.each do |command, value|
    case command
    when FORWARD
      coordinates["horizontal"] += value
    when DOWN
      coordinates["depth"] += value
    when UP
      coordinates["depth"] -= value
    end
  end

  coordinates
end

def advanced_calculate_position_and_depth(inputs : Array({String,Int32}))
  coordinates = { "horizontal" => 0, "depth" => 0 }
  aim = 0

  inputs.each do |command, value|
    case command
    when FORWARD
      coordinates["horizontal"] += value
      coordinates["depth"] += aim * value
    when DOWN
      aim += value
    when UP
      aim -= value
    end
  end

  coordinates
end

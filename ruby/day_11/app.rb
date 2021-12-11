# frozen_string_literal: true

require_relative './pod'
require 'byebug'

class Day11
  FILEPATH = '../../data/day_11/input.txt'

  def self.run
    new.run
  end

  def initialize
    load_input
  end

  def run
    pod = Pod.new(input)
    pod.step(100)
    flash_count = pod.flash_count

    pod = Pod.new(input)
    pod.step until pod.flash_count == pod.size
    synchronized_step = pod.step_number

    {
      flash_count: flash_count,
      synchronized_step: synchronized_step
    }
  end

  private

  attr_reader :input

  def load_input
    filepath = File.expand_path(FILEPATH, File.dirname(__FILE__))
    @input = File.readlines(filepath).map do |line|
      line.strip.chars.map(&:to_i)
    end
  end
end

result = Day11.run

puts "Flash Count: #{result[:flash_count]}"
puts "First Synchronized Step: #{result[:synchronized_step]}"

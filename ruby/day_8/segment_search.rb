# frozen_string_literal: true

require_relative './digit'
require_relative './entry'
require 'byebug'

def count_easy_digits(entries)
  outputs = entries.map { |entry| entry.split(' | ').last.split }.flatten
  outputs.reduce(0) do |acc, value|
    if ([1, 4, 7, 8] & Digit.with_segment_count(value.size)).any?
      acc + 1
    else
      acc
    end
  end
end

def decode_entries(entries)
  entries.reduce(0) do |acc, entry|
    acc + Entry.new(entry).decoded_output.to_i
  end
end

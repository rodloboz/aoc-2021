# frozen_string_literal: true

require_relative './board_array'

class Board
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows.map { |row| BoardArray.new(row) }
    @columns = columns.map { |column| BoardArray.new(column) }
    @completed = false
    @locked = false
  end

  def match(number)
    rows.each { |row| row.match(number) }
    columns.each { |column| column.match(number) }
    lock! if completed?
  end

  def locked?
    @locked
  end

  def score
    rows.reduce(0) { |acc, row| row.score + acc }
  end

  private

  def completed?
    @completed ||= rows.any?(&:completed?) || columns.any?(&:completed?)
  end

  def lock!
    @locked = true
  end
end

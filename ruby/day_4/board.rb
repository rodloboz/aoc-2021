require_relative './row'
require_relative './column'

class Board
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows.map { |row| Row.new(row) }
    @columns = columns.map { |column| Column.new(column) }
    @locked = false
  end

  def mark(number)
    rows.each do |row|
      row.mark(number)
    end

    columns.each do |column|
      column.mark(number)
    end

    lock! if completed?
  end

  def completed?
    rows.any?(&:completed?) || columns.any?(&:completed?)
  end

  def lock!
    @locked = true
  end

  def locked?
    @locked
  end

  def score
    rows.reduce(0) do |acc, row|
      row.unmarked_numbers.sum + acc
    end
  end
end

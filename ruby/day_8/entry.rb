# frozen_string_literal: true

require_relative './cypher'

class Entry
  attr_reader :signals, :outputs

  def initialize(string)
    @signals, @outputs = string.split(' | ').map(&:split)
    @cypher = Cypher.new(@signals)
  end

  def decoded_output
    cypher.decrypt(outputs).join
  end

  private

  attr_reader :cypher
end

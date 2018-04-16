# frozen_string_literal: true

require './lib/position.rb'
# Creatures who lives in the same position in the world
class Creature
  attr_accessor :position

  def initialize(position)
    @position = position
  end
end

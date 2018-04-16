# frozen_string_literal: true

# World for creatures and zombies to spend time in it.
class World
  attr_accessor :dimension

  def initialize(dimension)
    @dimension = dimension
  end
end

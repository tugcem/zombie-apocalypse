# frozen_string_literal: true

# Zombie which has position and can move
require_relative 'creature'

class Zombie < Creature
  def move(direction)
    @position.move(direction)
  end
end

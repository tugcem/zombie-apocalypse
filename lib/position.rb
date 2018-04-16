# frozen_string_literal: true

# Position to pass creatures who lives in the world
class Position
  attr_accessor :world, :x, :y

  def initialize(world, x, y)
    @world = world
    @x = x
    @y = y
  end

  def move(direction)
    send "move_#{direction}"
  end

  def in_same_grid_with(creature_position)
    @x == creature_position.x && @y == creature_position.y
  end

  def to_s
    "(#{@x},#{@y})"
  end

  private

  def move_up
    @y = decrease_value(@y)
  end

  def move_down
    @y = increase_value(@y)
  end

  def move_left
    @x = decrease_value(@x)
  end

  def move_right
    @x = increase_value(@x)
  end

  def increase_value(axis)
    axis == far_end_of_world ? 0 : (axis + 1)
  end

  def decrease_value(axis)
    axis.zero? ? far_end_of_world : (axis - 1)
  end

  def far_end_of_world
    @far_end_of_world ||= @world.dimension - 1
  end
end

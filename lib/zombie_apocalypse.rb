# frozen_string_literal: true

# Position to pass creatures who lives in the world
class ZombieApocalypse
  attr_accessor :world, :zombies, :creatures, :list_of_moves, :zombies_score

  def initialize(dimension, p_of_the_zombie, p_of_creatures, list_of_moves)
    @world = World.new(dimension)
    @zombies = initialize_zombies(p_of_the_zombie)
    @creatures = initialize_creatures(p_of_creatures)
    @list_of_moves = list_of_moves
    @zombies_score = 0
  end

  def initialize_zombies(position)
    zombies = []
    zombie_position = Position.new(@world,
                                   position[:x],
                                   position[:y])
    zombies.push Zombie.new(zombie_position)
  end

  def initialize_creatures(positions)
    creatures = []
    positions.each do |position|
      creature_position = Position.new(@world,
                                       position[:x],
                                       position[:y])
      creatures.push Creature.new(creature_position)
    end
    creatures
  end

  def run!
    @zombies.each do |zombie|
      @list_of_moves.each do |direction|
        zombie.move(direction)
        creatures_to_zombies = @creatures.select do |creature|
          zombie.position.in_same_grid_with(creature.position)
        end
        transform_to_zombies(creatures_to_zombies)
      end
    end
  end

  def transform_to_zombies(creatures)
    creatures.each do |creature|
      @zombies_score += 1
      @zombies.push Zombie.new(creature.position)
      @creatures.delete creature
    end
  end
end

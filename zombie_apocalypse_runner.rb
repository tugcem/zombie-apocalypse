# frozen_string_literal: true

require './lib/world.rb'
require './lib/position.rb'
require './lib/creature.rb'
require './lib/zombie.rb'
require './lib/helpers.rb'
require './lib/zombie_apocalypse.rb'

# Simulation of Zombie Apocalypse which starts by initializing zombie apocalype
# and then run and print the total score and position of the zombies
module ZombieApocalypseRunner
  parameters        = Helpers.extract_parameters_from('INPUT.txt')
  zombie_apocalypse = ZombieApocalypse.new(parameters[:dimension_of_world],
                                           parameters[:position_of_the_zombie],
                                           parameters[:positions_of_creatures],
                                           parameters[:list_of_moves])
  zombie_apocalypse.run!

  puts "zombies score: #{zombie_apocalypse.zombies_score}"
  position_string = 'zombies positions: '
  zombie_apocalypse.zombies.each do |zombie|
    position_string += zombie.position.to_s
  end
  puts position_string
end

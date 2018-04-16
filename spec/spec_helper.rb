# frozen_string_literal: true

Dir['./lib/*.rb'].each { |file| require file }

HELPER_MOCK_OUTPUT = { :dimension_of_world => 4,
                       :position_of_the_zombie => { :x => 2, :y => 1 },
                       :positions_of_creatures=>[{ :x => 0, :y => 1 },
                                                 { :x => 1, :y => 2 },
                                                 { :x => 3, :y => 1 }],
                      :list_of_moves => %w[down left up up right right]}

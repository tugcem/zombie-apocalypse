# frozen_string_literal: true

# Helper methods for sterilizing, validating and passing given inputs
# through to apocalypse in a hash
module Helpers
  DIRECTIONS = {
    'U' => 'up',
    'D' => 'down',
    'L' => 'left',
    'R' => 'right'
  }.freeze

  def self.extract_parameters_from(file)
    file_content_by_line = File.read(file).split("\n")
    {
      dimension_of_world: validate_dimension(file_content_by_line[0]),
      position_of_the_zombie: parse_positions(file_content_by_line[1])[0],
      positions_of_creatures: parse_positions(file_content_by_line[2]),
      list_of_moves: extend_move_commands(file_content_by_line[3])
    }
  end

  private

  def self.validate_dimension(dimension)
    validate_integer(dimension)
  rescue ArgumentError
    abort dimension_warning
  end

  def self.parse_positions(positions)
    abort positions_warning if positions.empty?

    parsed_positions = []
    positions.split(/[()]/).each do |position|
      next if position.empty?
      position = position.split(',')
      parsed_positions.push(x: validate_position(position[0]),
                            y: validate_position(position[1]))
    end
    parsed_positions
  end

  def self.validate_position(axis)
    validate_integer(axis)
  rescue ArgumentError
    abort positions_warning
  end

  def self.extend_move_commands(moves)
    validate_moves(moves)
    moves.split('').map { |direction| DIRECTIONS[direction] }
  rescue ArgumentError
    abort moves_warning
  end

  def self.validate_moves(moves)
    invalid_moves = moves.split('').any? do |direction|
      !DIRECTIONS.keys.include?(direction)
    end
    raise ArgumentError if invalid_moves || moves.empty?
  end

  def self.validate_integer(value)
    Integer(value)
  end

  def self.dimension_warning
    'Please provide integer for the world dimension. Ex: 4'
  end

  def self.positions_warning
    'Please provide integer values to positions. Ex: (2,1) or (0,1)(1,2)(3,1)'
  end

  def self.moves_warning
    'Please provide list of valid moves. Ex: DLUURR'
  end
end

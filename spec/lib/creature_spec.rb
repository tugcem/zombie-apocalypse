# frozen_string_literal: true

describe Creature do
  let(:world) { World.new(4) }
  let(:position) { Position.new world, 2, 1 }
  let(:creature) { described_class.new position }

  it 'should be a Creature object' do
    expect(creature).to be_a Creature
  end

  it 'should have a position' do
    expect(creature.position).to be_a Position
  end
end

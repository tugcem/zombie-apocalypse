# frozen_string_literal: true

describe Zombie do
  let(:world) { World.new(4) }
  let(:position) { Position.new world, 2, 1 }
  let(:zombie) { described_class.new position }

  it 'should be a Zombie object' do
    expect(zombie).to be_a Zombie
  end

  it 'should have a position' do
    expect(zombie.position).to be_a Position
  end

  it 'should be able to move' do
    expect(zombie.position).to receive(:move).with('up')
    zombie.move('up')
  end
end

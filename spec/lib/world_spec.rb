# frozen_string_literal: true

describe World do
  let(:dimension) { 4 }
  let(:world) { described_class.new dimension }

  it 'should be a World object' do
    expect(world).to be_a World
  end

  it 'should have integer value of dimension' do
    expect(world.dimension).to eq 4
  end
end

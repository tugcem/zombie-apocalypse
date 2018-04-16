# frozen_string_literal: true

describe Position do
  let(:world) { World.new(4) }
  let(:position) { described_class.new world, 2, 1 }
  let(:same_position) { described_class.new world, 2, 1 }
  let(:different_position) { described_class.new world, 3, 1 }

  describe '#new' do
    it 'should be a Position object' do
      expect(position).to be_a Position
    end

    it 'should be on the world object with dimension 4' do
      expect(position.world).to be_a World
      expect(position.world.dimension).to eq 4
    end

    it 'should have integer value of x and y axis' do
      expect(position.x).to eq 2
      expect(position.y).to eq 1
    end
  end

  describe '#move' do
    it 'should call move_up' do
      expect(position).to receive(:move_up)
      position.move('up')
    end

    it 'should call move_down' do
      expect(position).to receive(:move_down)
      position.move('down')
    end

    it 'should call move_left' do
      expect(position).to receive(:move_left)
      position.move('left')
    end

    it 'should call move_right' do
      expect(position).to receive(:move_right)
      position.move('right')
    end
  end

  describe '#in_same_grid_with' do
    context 'if position argument is in the same grid' do
      it 'should return true' do
        expect(position.in_same_grid_with(same_position)).to eq true
      end
    end
    context 'if position argument is not in the same grid' do
      it 'should return true' do
        expect(position.in_same_grid_with(different_position)).to eq false
      end
    end
  end

  describe '#to_s' do
    it 'should return (2,1)' do
      expect(position.to_s).to eq '(2,1)'
    end
  end

  describe '#move_up' do
    it 'should call decrease_value' do
      expect(position).to receive(:decrease_value).with(1)
      position.send(:move_up)
    end
  end

  describe '#move_down' do
    it 'should call increase_value' do
      expect(position).to receive(:increase_value).with(1)
      position.send(:move_down)
    end
  end

  describe '#move_left' do
    it 'should call decrease_value' do
      expect(position).to receive(:decrease_value).with(2)
      position.send(:move_left)
    end
  end

  describe '#move_right' do
    it 'should call increase_value' do
      expect(position).to receive(:increase_value).with(2)
      position.send(:move_right)
    end
  end

  describe '#increase_value' do
    context 'if the value is not equal to the value of far end grid of world' do
      it 'should increase the value' do
        expect(position.send(:increase_value, 1)).to eq 2
      end
    end
    context 'if the value is equal to the value of far end grid of world' do
      it 'should return zero' do
        expect(position.send(:increase_value, 3)).to eq 0
      end
    end
  end

  describe '#decrease_value' do
    context 'if the value is not zero' do
      it 'should decrease the value' do
        expect(position.send(:decrease_value, 2)).to eq 1
      end
    end
    context 'if the value is equal to 0' do
      it 'should return the value of far end grid of world' do
        expect(position.send(:decrease_value, 0)).to eq 3
      end
    end
  end

  describe '#far_end_of_world' do
    it 'should return the value of far end grid of world' do
      expect(position.send(:far_end_of_world)).to eq world.dimension - 1
    end
  end
end

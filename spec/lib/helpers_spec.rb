# frozen_string_literal: true

describe 'Helpers' do
  let(:file) { 'INPUT.txt' }

  describe '#extract_parameters_from' do
    it 'should return a hash' do
      parameters = Helpers.extract_parameters_from(file)
      expect(parameters).to be_a Hash
      expect(parameters).to eq HELPER_MOCK_OUTPUT
    end
  end

  describe '#validate_dimension' do
    context 'if dimension is valid' do
      it 'should return integer' do
        expect(Helpers.validate_dimension('4')).to eq 4
      end
    end

    context 'if dimension is empty or invalid' do
      it 'should exit with warning' do
        expect { Helpers.validate_dimension('') }.to raise_error SystemExit
        expect { Helpers.validate_dimension('n') }.to raise_error SystemExit
      end
    end
  end

  describe '#parse_positions' do
    context 'if position is valid' do
      it 'should return parsed position hash' do
        positions = HELPER_MOCK_OUTPUT[:positions_of_creatures]
        expect(Helpers.parse_positions('(0,1)(1,2)(3,1)')).to eq positions
      end
    end

    context 'if position is empty or invalid' do
      it 'should exit with warning' do
        expect { Helpers.parse_positions('') }.to raise_error SystemExit
        expect { Helpers.parse_positions('n') }.to raise_error SystemExit
      end
    end
  end

  describe '#validate_position' do
    context 'if position is valid' do
      it 'should return value' do
        expect(Helpers.validate_position('1')).to eq 1
      end
    end

    context 'if position is empty or invalid' do
      it 'should exit with warning' do
        expect { Helpers.validate_position('') }.to raise_error SystemExit
        expect { Helpers.validate_position('n') }.to raise_error SystemExit
      end
    end
  end

  describe '#extend_move_commands' do
    context 'if moves are valid' do
      it 'should return list of moves' do
        list_of_moves = HELPER_MOCK_OUTPUT[:list_of_moves]
        expect(Helpers.extend_move_commands('DLUURR')).to eq list_of_moves
      end
    end

    context 'if moves are empty or invalid' do
      it 'should exit with warning' do
        expect { Helpers.extend_move_commands('') }.to raise_error SystemExit
        expect { Helpers.extend_move_commands('n') }.to raise_error SystemExit
      end
    end
  end

  describe '#validate_moves' do
    context 'if moves are empty or invalid' do
      it 'should raise ArgumentError' do
        expect { Helpers.validate_moves('') }.to raise_error ArgumentError
        expect { Helpers.validate_moves('n') }.to raise_error ArgumentError
      end
    end
  end
end

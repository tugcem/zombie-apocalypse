# frozen_string_literal: true

describe ZombieApocalypse do
  let(:dimension_of_world) { HELPER_MOCK_OUTPUT[:dimension_of_world] }
  let(:position_of_the_zombie) { HELPER_MOCK_OUTPUT[:position_of_the_zombie] }
  let(:positions_of_creatures) { HELPER_MOCK_OUTPUT[:positions_of_creatures] }
  let(:list_of_moves) { HELPER_MOCK_OUTPUT[:list_of_moves]   }
  let(:zombie_apocalypse) { described_class.new dimension_of_world,
                                                position_of_the_zombie,
                                                positions_of_creatures,
                                                list_of_moves
                          }
  describe '#new' do
    it 'should be a ZombieApocalypse object' do
      expect(zombie_apocalypse).to be_a ZombieApocalypse
    end

    it 'should be on the world with dimension 4' do
      expect(zombie_apocalypse.world).to be_a World
    end

    it 'should be have the zombie' do
      zombie = zombie_apocalypse.zombies[0]
      expect(zombie).to be_a Zombie
    end

    it 'should have 3 creatures' do
      expect(zombie_apocalypse.creatures.length).to eq 3
      expect(zombie_apocalypse.creatures).to all(be_a Creature)
    end
  end

  describe '#run!' do
    before do
      zombie_apocalypse.run!
    end

    describe '#zombies' do
      it 'should have 3 more zombies' do
        expect(zombie_apocalypse.zombies.length).to eq 4
      end

      it 'should be all zombies' do
        expect(zombie_apocalypse.zombies).to all(be_a Zombie)
      end

      it 'should place zombies in these positions (3,0)(2,1)(1,0)(0,0)' do
        latest_positions = [{ x: 3, y: 0 }, { x: 2, y: 1 }, { x: 1, y: 0 }, { x: 0, y: 0 }]
        zombie_apocalypse.zombies.each_with_index do |zombie, index|
          expect(zombie.position.x).to eq latest_positions[index][:x]
          expect(zombie.position.y).to eq latest_positions[index][:y]
        end
      end
    end

    describe '#creatures' do
      it 'should have no creatures' do
        expect(zombie_apocalypse.creatures.length).to eq 0
      end
    end
  end

  describe '#zombies_score' do
    before do
      zombie_apocalypse.run!
    end

    it 'should be 3' do
      expect(zombie_apocalypse.zombies_score).to eq 3
    end
  end
end

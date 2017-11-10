require 'player'

describe Player do

  let(:player1) { described_class.new('Antonio') }
  let(:player2) { described_class.new('Ignacio') }

  describe '#initilize' do
    it 'has a name' do
      expect(player1.name).to eq 'Antonio'
    end
  end

  describe '#reduce_hp' do
    it 'reduces hp by 10' do
      allow(Player).to receive(:show_damage).and_return(10)
      expect { player2.reduce_hp }.to change { player2.hp }.by(-10)
    end
  end
end

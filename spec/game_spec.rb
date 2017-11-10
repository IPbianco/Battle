require 'game'

describe Game do
  let(:player1) { double(:player1, reduce_hp: 'reduced!', hp: 60) }
  let(:player2) { double(:player2, reduce_hp: 'reduced!', hp: 60) }

  subject(:game) { described_class.new(player1, player2) }

  describe "#initialize" do
    it "accepts two arguments when initializing" do
      expect(Game).to respond_to(:new).with(2).arguments
    end

    it "expects to first argument to be stored as player 1" do
      expect(game.player1).to eq(player1)
    end

    it "expects to first argument to be stored as player 2" do
      expect(game.player2).to eq(player2)
    end
  end

  describe "#attack" do
    it 'changes turn from P1 to P2' do
      subject.attack
      expect(subject.turn).to eq 2
    end

    it 'changes turn from P2 to P1' do
      subject.attack
      subject.attack
      expect(subject.turn).to eq 1
    end

    it 'it attacks P2 when turn is 1' do
      expect(subject).to receive(:private_attack)
      subject.attack
    end

    it 'it attacks P1 when turn is 2' do
      subject.attack
      expect(subject).to receive(:private_attack)
      subject.attack
    end

    it 'returns true if blocked' do
      allow(subject).to receive(:private_attack).and_return 60
      expect(subject.attack).to eq true
    end

    it 'returns false if hp after attack and before attack is different' do
      allow(subject).to receive(:private_attack).and_return 40
      expect(subject.attack).to eq false
    end
  end

  describe '#sel.store' do
    it 'stores an instance of Game' do
      Game.store(subject)
      expect(Game.show).to eq subject
    end
  end
end

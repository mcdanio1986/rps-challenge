require 'player'

describe Player do
  subject { Player.new("Player") }

  context '#initialize' do
    it "checking player name" do
      expect(subject.name).to eq "Player"
    end

    it 'testing emoty move' do
      expect(subject.move).to eq ""
    end
  end

  context '#pick_move' do
    it 'choosing move' do
      subject.pick_move(:Paper)
      expect(subject.move).to eq :Paper
    end
  end
end

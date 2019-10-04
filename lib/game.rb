class Game
  attr_reader :player_1, :player_2

  WINS = {
    :Scissors => [:Paper], #easy way to add more weapons 
    :Paper => [:Rock],
    :Rock => [:Scissors],

  }

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def self.create(player_1, player_2 = Computer.new)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def result
    if WINS.values_at(@player_1.move).any? { |x| x.include?(@player_2.move) }
      "Win"
    elsif @player_1.move == @player_2.move
      "Draw"
    elsif WINS.values_at(@player_2.move).any? { |x| x.include?(@player_1.move) }
      "Lose"
    else
      fail "Move not valid."
    end
  end

  def message
    result
    case result
    when "Win"
      "#{@player_1.name} wins!"
    when "Lose"
      "#{@player_2.name} wins!"
    when "Draw"
      "Draw!"
    end
  end
end

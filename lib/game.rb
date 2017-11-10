class Game
  attr_reader :player1, :player2, :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
  end

  def attack
    if @turn == 1
      @turn = 2
      attack_p2
    else
      @turn = 1
      attack_p1
    end
  end

  def self.store(game)
    @game = game
  end

  def self.show
    @game
  end
  
  private

  def attack_p1
    @player1.reduce_hp
  end

  def attack_p2
    @player2.reduce_hp
  end

end

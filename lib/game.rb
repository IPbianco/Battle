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
      before_attack_hp = @player2.hp
      attack_p2
      after_attack_hp = @player2.hp
      before_attack_hp == after_attack_hp ? @blocked = true : @blocked = false
    else
      @turn = 1
      before_attack_hp = @player1.hp
      attack_p1
      after_attack_hp = @player1.hp
      before_attack_hp == after_attack_hp ? @blocked = true : @blocked = false
    end
  end

  def confirmation
    if @turn == 2
      if !@blocked
        "#{@player1.name} attacked #{@player2.name}."
      else
        "#{@player1.name} blocked #{@player2.name}."
      end
    else
      if !@blocked
        "#{@player2.name} attacked #{@player1.name}."
      else
        "#{@player2.name} blocked #{@player1.name}."
      end
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

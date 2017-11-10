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
      block_check(@player2)
    else
      @turn = 1
      block_check(@player1)
    end
  end

  def confirmation
    if @turn == 2
      if !@blocked
        "#{@player1.name} attacked #{@player2.name}."
      else
        "#{@player2.name} blocked #{@player1.name}."
      end
    else
      if !@blocked
        "#{@player2.name} attacked #{@player1.name}."
      else
        "#{@player1.name} blocked #{@player2.name}."
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

  def block_check(player)
    before_attack_hp = player.hp
    after_attack_hp = private_attack(player)
    before_attack_hp == after_attack_hp ? @blocked = true : @blocked = false
  end

  def private_attack(player)
    player.reduce_hp
  end

end

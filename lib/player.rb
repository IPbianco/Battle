class Player
  attr_reader :name, :hp
  STARTING_HP = 60
  DAMAGE_HP = 10

 def initialize(name)
   @name = name
   @hp = STARTING_HP
 end

 def reduce_hp
   @hp -= DAMAGE_HP if @hp > 0
 end
end

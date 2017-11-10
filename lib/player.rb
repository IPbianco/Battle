class Player
  attr_reader :name, :hp, :damages
  STARTING_HP = 60
  DAMAGE_HP = 10

 def initialize(name)
   @name = name
   @hp = STARTING_HP
 end

 def reduce_hp
   @hp -= damage if @hp > 0
   p damage
   @hp = 0 if @hp < 0
   @hp
 end

 private

 def damage
   Player.show_damage
 end

 def self.show_damage
   @damages = [0, 5, 10].sample
 end
end

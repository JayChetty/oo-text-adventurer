class Target
  attr_reader :health, :name
  def initialize(health, name)
    @health = health
    @name = name
  end

  def take_hit(damage)
    @health -= damage
  end
end
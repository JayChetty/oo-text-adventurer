class Target
  attr_reader :health
  def initialize(health)
    @health = health
  end

  def take_hit(damage)
    @health -= damage
  end
end
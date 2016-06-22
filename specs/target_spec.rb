require( 'minitest/autorun' )
require_relative( '../models/target' )

class TargetSpec < Minitest::Test
  def setup
    @target = Target.new(10, "Door")
  end

  def test_health
    assertEqual(10, @target.health)
  end

  def test_take_hit
    @target.take_hit(1)
    assertEqual(9, @target.health)
  end

  def test_has_name
    assertEqual("Door", @target.name)
  end
end
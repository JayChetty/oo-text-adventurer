require( 'minitest/autorun' )
require_relative( '../models/adventurer' )

class TestRune
  def test_method
    return "from summon"
  end
end

class AdventurerSpec < Minitest::Test
  def setup
    @adventurer = Adventurer.new()
  end

  def test_has_array_of_runes
    assert_equal( [], @adventurer.runes )
  end

  def test_start_with_nil_current_rune
    assert_equal( nil, @adventurer.current_rune )
  end

  def test_should_be_able_to_add_rune
    @adventurer.add_rune(TestRune)
    assert_equal( [TestRune], @adventurer.runes )
  end

  def test_should_be_to_set_rune
    @adventurer.add_rune(TestRune)
    @adventurer.set_current_rune(0)
    assert_equal( TestRune , @adventurer.current_rune )
  end

  def test_should_start_with_a_nil_current_summon
    assert_equal( nil, @adventurer.current_summon )
  end

  def test_can_create_summon_from_rune
    @adventurer.add_rune(TestRune)
    @adventurer.set_current_rune(0)
    @adventurer.summon_from_rune
    assert( !@adventurer.current_summon.nil? )
  end

end

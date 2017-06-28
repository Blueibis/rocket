require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def test_new_rocket_default_flying_is_false
    rocket = Rocket.new(name: "Carl V", colour: "Blue")
    result = rocket.flying?
    assert_equal(false, result)
  end

  def test_lift_off_returns_false_if_already_flying
    rocket = Rocket.new(flying: true)
    assert_equal(false, rocket.lift_off)
  end

  def test_lift_off_returns_true_if_grounded
    rocket = Rocket.new
    assert_equal(true, rocket.lift_off)
  end

  def test_status_works_if_flying_false
    rocket = Rocket.new
    assertion = "Rocket #{rocket.name} is ready for lift off!"
    assert_equal(assertion, rocket.status)
  end

  def test_land_sets_flying_to_false_if_flying
    rocket = Rocket.new(flying: true)
    rocket.land
    assert_equal(false, rocket.flying?)
  end

  def test_that_lift_off_and_land_in_concert
    rocket = Rocket.new
    rocket.lift_off
    rocket.land
    assert_equal(false, rocket.flying?)
  end

  def test_land_fixes_flying_when_not_boolean
    rocket = Rocket.new(flying: "I believe I can fly!")
    rocket.land
    assert_equal(false, rocket.flying?)
  end

end

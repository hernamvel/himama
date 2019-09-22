require 'test_helper'

class ClockEventTest < ActiveSupport::TestCase
  test "inserts a clock envent properly" do
    user = users(:hernan)
    assert_difference 'ClockEvent.count' do
      clock_event = ClockEvent.new
      clock_event.event_type = :clock_in
      clock_event.user = user
      clock_event.save
      assert clock_event.persisted?
      assert_equal clock_event.event_type, 'clock_in'
      assert_equal clock_event.user.id, user.id
      assert_equal clock_event.user.current_event.id, clock_event.id
    end
  end

  test "updates a clock event properly" do
    clock_event = clock_events(:liliana_1)
    clock_event.event_type = :clock_out
    clock_event.save
    assert clock_event.persisted?
    assert_equal clock_event.event_type, 'clock_out'
  end

  test "destroys and event properly" do
    clock_event = clock_events(:liliana_1)
    clock_event.destroy
    refute clock_event.persisted?
  end

  test "unable to destroy since its an user current event" do
    clock_event = clock_events(:liliana_2)
    refute clock_event.destroy
  end

end

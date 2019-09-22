require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "inserts a user properly" do
    assert_difference 'User.count' do
      user = User.new
      user.email = 'pepe@pepito.com'
      user.password = '123qweadd'
      user.save
      assert user.persisted?
      assert_equal user.email, 'pepe@pepito.com'
    end
  end

  test "user with no password will not insert" do
    user = User.new
    user.email = 'pepe@pepito.com'
    user.save
    refute user.persisted?
  end

  test "when current_event is clock_in, next event will be clock out" do
    user = users(:liliana)
    next_event = user.next_event_to_log
    assert_equal next_event, :clock_in
  end

  test "for an user with no current_event, his next event should be clock_in" do
    user = users(:hernan)
    next_event = user.next_event_to_log
    assert_equal next_event, :clock_in
  end

end
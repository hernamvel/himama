require 'test_helper'

class ClockEventsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:liliana)
    sign_in(@user)
    @clock_event = clock_events(:liliana_1)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create clock_event" do
    assert_difference('ClockEvent.count') do
      post :create
    end
    assert_redirected_to clock_events_url
  end

  test "should not create a clock event" do
    ClockEvent.any_instance.stubs(:save).returns(false)
    assert_no_difference('ClockEvent.count') do
      post :create
    end
    assert_redirected_to clock_events_url
  end

  test "should get edit" do
    get :edit, params: {id: @clock_event.id}
    assert_response :success
  end

  test "should update clock_event" do
    patch :update,
          params: { id: @clock_event.id,
                    clock_event: {event_type: :clock_out }
    }
    assert_equal(ClockEvent.find(@clock_event.id).event_type, 'clock_out')
    assert_redirected_to clock_events_url
  end

  test "should not update clock_event" do
    ClockEvent.any_instance.stubs(:save).returns(false)
    patch :update,
          params: { id: @clock_event.id,
                    clock_event: {event_type: :clock_out }
          }
    assert_redirected_to clock_events_url
  end


  test "should destroy clock_event" do
    assert_difference('ClockEvent.count', -1) do
      delete :destroy, params: { id: @clock_event.id }
    end
    assert_redirected_to clock_events_url
  end
end

class ClockEvent < ApplicationRecord
  belongs_to :user
  enum event_type: [:clock_in, :clock_out]

  before_destroy :check_no_user_current
  after_create :refresh_user_current_event

  def refresh_user_current_event
    user.current_event = self
    user.save!
  end

  def check_no_user_current
    if self.user.current_event.id == self.id
      throw(:abort)
    end
  end

  def is_current_for?(user)
    user&.current_event.id == self.id
  end

end

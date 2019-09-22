class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clock_events
  belongs_to :current_event, class_name: 'ClockEvent', optional: true

  def next_event_to_log
    if current_event
      current_event.event_type.to_sym == :clock_out ? :clock_in : :clock_out
    else
      :clock_in
    end
  end

end

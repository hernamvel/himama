module ClockEventsHelper

  def display_current_event
    if current_user.current_event
      t(current_user.current_event.event_type)
    else
      t('no_current_log')
    end
  end

  def next_event_link
    if current_user.next_event_to_log == :clock_in
      link_to :clock_in, "#"
    else
      link_to :clock_out, "#"
    end
  end

  def current_event_class(event)
    if current_user.current_event && event.id == current_user.current_event.id
      'class="table-success"'.html_safe
    else
      ''
    end
  end

  def event_type_options
    [[t('clock_in'), 'clock_in'],[t('clock_out'), 'clock_out']]
  end
end

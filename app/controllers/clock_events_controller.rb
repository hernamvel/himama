class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:edit, :update, :destroy]

  # GET /clock_events
  # GET /clock_events.json
  def index
    @clock_events = ClockEvent.where(user_id: current_user.id).order("id desc")
  end

  # GET /clock_events/:id/edit
  def edit
  end

  # POST /clock_events
  def create
    @clock_event = ClockEvent.new
    @clock_event.user = current_user
    @clock_event.event_type = current_user.next_event_to_log
    if @clock_event.save
      redirect_to clock_events_url, notice: 'Clock event was successfully created.'
    else
      redirect_to clock_events_url, alert: 'Clock event was NOT successfully created.'
    end
  end

  # PATCH/PUT /clock_events/:id
  def update
    @clock_event.event_type = params[:clock_event][:event_type]
    if @clock_event.save
      redirect_to clock_events_url, notice: 'Clock event was successfully created.'
    else
      redirect_to clock_events_url, alert: 'Clock event was NOT successfully updated.'
    end
  end

  # DELETE /clock_events/:id
  def destroy
    @clock_event.destroy
    redirect_to clock_events_url, notice: 'Clock event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_event
      @clock_event = ClockEvent.find(params[:id])
    end

end

class ClockEventsController < ApplicationController
  before_action :set_clock_event, only: [:show, :edit, :update, :destroy]

  # GET /clock_events
  # GET /clock_events.json
  def index
    @clock_events = ClockEvent.order("id desc")
  end

  # GET /clock_events/1
  # GET /clock_events/1.json
  def show
  end

  # GET /clock_events/new
  def new
    @clock_event = ClockEvent.new
  end

  # GET /clock_events/1/edit
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

  # PATCH/PUT /clock_events/1
  def update
    @clock_event.event_type = params[:clock_event][:event_type]
    if @clock_event.save
      redirect_to clock_events_url, notice: 'Clock event was successfully created.'
    else
      redirect_to clock_events_url, alert: 'Clock event was NOT successfully updated.'
    end
  end

  # DELETE /clock_events/1
  def destroy
    @clock_event.destroy
    respond_to do |format|
      format.html { redirect_to clock_events_url, notice: 'Clock event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_event
      @clock_event = ClockEvent.find(params[:id])
    end

end

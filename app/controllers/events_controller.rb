#require 'icalendar'
require 'icalendar/tzinfo'
require 'tzinfo'

class EventsController < ApplicationController

  before_action :requires_admin, only: [:new, :edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :ical]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def ical
    cal = Icalendar::Calendar.new

    event_start = @event.starts_at.in_time_zone + 8.hours
    event_end = (event_start + @event.duration.hours)
    tzid = "UTC"
    tz = TZInfo::Timezone.get tzid
    timezone = tz.ical_timezone event_start
    cal.add_timezone timezone


    event = Icalendar::Event.new
    event.dtstart = Icalendar::Values::DateTime.new event_start, 'tzid' => tzid
    event.dtend = Icalendar::Values::DateTime.new event_end, 'tzid' => tzid
    event.description= @event.description
    event.summary = @event.description
    event.uid = event.url = event_url(@event)
    cal.add_event(event)
    cal.publish

    ical_event = cal.to_ical.split("\n")
    #.join("\n")
    render plain:  ical_event.join("\n")
    #send_data cal.to_ical, type: 'ical', disposition: 'inline', filename: 'event.ical'
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to action: :index, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :starts_at, :duration, :description, :link, :logo, :you_tube)
    end
end

class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_event, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    inactive_events = InactiveEvent.where(date: Date.today).pluck(:event_id)
    @events = Event.where.not(id: inactive_events)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.includes(:tickets, :inactive_events).find(params[:id])
    @new_inactive_event = InactiveEvent.new(event: @event)
    @new_ticket = Ticket.new(event: @event)
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
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
      else
        format.html { render :edit }
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
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :description, :start_date, :end_date, :user_id)
    end
end

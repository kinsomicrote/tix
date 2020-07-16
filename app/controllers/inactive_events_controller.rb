class InactiveEventsController < ApplicationController
  before_action :authenticate_user!, :except => [:create, :new, :destroy]
  before_action :set_inactive_event, only: [:destroy]


  # GET /inactive_events/new
  def new
    @inactive_event = InactiveEvent.new
  end

  # POST /inactive_events
  # POST /inactive_events.json
  def create
    @inactive_event = InactiveEvent.find_or_create_by(inactive_event_params)

    respond_to do |format|
      if @inactive_event.save
        format.html { redirect_to event_path(params[:inactive_event]['event_id']), notice: 'Inactive date was successfully created.' }
      else
        format.html { redirect_to event_path(params[:inactive_event]['event_id']), notice: @inactive_event.errors.messages[:date][0] }
      end
    end
  end


  # DELETE /inactive_events/1
  # DELETE /inactive_events/1.json
  def destroy
    @inactive_event.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@inactive_event.event_id), notice: 'Inactive event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inactive_event
      @inactive_event = InactiveEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inactive_event_params
      params.require(:inactive_event).permit(:date, :event_id)
    end
end

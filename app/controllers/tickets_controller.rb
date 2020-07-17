class TicketsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :edit, :update, :destroy]
  before_action :set_ticket, only: [:edit, :update, :destroy]

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to event_path(params[:ticket]['event_id']), notice: 'Ticket was successfully created.' }
      else
        format.html { redirect_to event_path(params[:ticket]['event_id']) }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to event_path(params[:ticket]['event_id']), notice: 'Ticket was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@ticket.event_id), notice: 'Ticket was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:name, :option, :amount, :event_id)
    end
end

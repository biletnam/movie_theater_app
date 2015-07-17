class TicketOfferingsController < ApplicationController
  before_action :set_ticket_offering, only: [:show, :edit, :update, :destroy]

  # GET /ticket_offerings
  # GET /ticket_offerings.json
  def index
    @ticket_offerings = TicketOffering.all
    @ticket_offering = TicketOffering.new
  end

  # GET /ticket_offerings/1
  # GET /ticket_offerings/1.json
  def show
  end

  # GET /ticket_offerings/new
  def new
    @ticket_offering = TicketOffering.new
  end

  # GET /ticket_offerings/1/edit
  def edit
  end

  # POST /ticket_offerings
  # POST /ticket_offerings.json
  def create
    @ticket_offering = TicketOffering.new(ticket_offering_params)

    respond_to do |format|
      if @ticket_offering.save
        format.html { redirect_to ticket_offerings_url, notice: 'Ticket offering was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /ticket_offerings/1
  # PATCH/PUT /ticket_offerings/1.json
  def update
    respond_to do |format|
      if @ticket_offering.update(ticket_offering_params)
        format.html { redirect_to ticket_offerings_url, notice: 'Ticket offering was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /ticket_offerings/1
  # DELETE /ticket_offerings/1.json
  def destroy
    @ticket_offering.destroy
    respond_to do |format|
      format.html { redirect_to ticket_offerings_url, notice: 'Ticket offering was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_offering
      @ticket_offering = TicketOffering.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_offering_params
      params.require(:ticket_offering).permit(:name, :price, :movie_theater_id)
    end

end

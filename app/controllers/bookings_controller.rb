class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :create_tickets_array, only: [:new, :create]
  before_action :set_months_years_arrays, only: [:new, :create]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        @booking.create_tickets(@tickets, @showing_id)
        @booking.set_total_cost
        format.html { redirect_to @booking }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)

        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:name, :email, :cc_number, :cc_cvc, :cc_exp_mon,
                                      :cc_exp_yr, :buyer_age_confirmed, :total_cost, :tickets, :showing_id)
    end

    def set_months_years_arrays
      @months =[  ["Jan (01)", "01"],
                ["Feb (02)", "02"],
                ["Mar (03)", "03"],
                ["Apr (04)", "04"],
                ["May (05)", "05"],
                ["June (06)", "06"],
                ["July (07)", "07"],
                ["Aug (08)", "08"],
                ["Sep (09)", "09"],
                ["Oct (10)", "10"],
                ["Nov (11)", "11"],
                ["Dec (12)", "12"]
              ]
      @years =[["2015","2015"],
            ["2016","2016"],
            ["2017","2017"],
            ["2018","2018"],
            ["2019","2019"],
            ["2020","2020"],
            ["2021","2021"],
            ["2022","2022"],
            ["2023","2023"]]
    end


    def create_tickets_array
      @tickets = params[:tickets]
      @showing_id = params[:showing_id]
    end
end

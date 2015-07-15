class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_tickets_and_showing, only: [:new, :create]
  before_action :set_months_years_arrays, only: [:new, :create]
  before_action :check_ticket_quantity, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.showing_id = @showing_id

    respond_to do |format|
      if @booking.save
        @booking.create_tickets(@tickets, @showing_id)
        @booking.set_total_cost
        @booking.set_movie_id
        BookingMailer.receipt(@booking).deliver_now
        format.html { redirect_to @booking }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

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

    def set_tickets_and_showing
      @tickets = params[:tickets]
      @showing_id = params[:showing_id]
    end

    def check_ticket_quantity
      unless Showing.find(@showing_id).amount_of_seats_remaining >= @tickets.values.map(&:to_i).sum
        redirect_to :back, :notice => "Sorry you are trying to purchase more tickets than we have seats remaining, please modify your order."
      end
      rescue ActionController::RedirectBackError
        redirect_to root_path
    end
end

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_other_variables, only: [:new, :create, :check_ticket_quantity]
  before_action :check_ticket_quantity, only: [:new, :create]
  before_action :total_cost, only: [:new, :create]

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
    @booking.movie_id = @movie.id

    respond_to do |format|
      if @booking.save
        @booking.create_tickets(@tickets, @showing_id)
        BookingMailer.receipt(@booking).deliver_now
        format.html { redirect_to @booking }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
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

    def set_other_variables
      @tickets = params[:tickets]
      @showing_id = params[:showing_id]
      @showing = Showing.find(@showing_id)
      @movie = @showing.movie
    end

    def check_ticket_quantity
      if @showing.amount_of_seats_remaining < @tickets.values.map(&:to_i).sum
        redirect_to :back, :notice => "Sorry you are trying to purchase more tickets than we have seats remaining, please modify your order."
      elsif @tickets.values.map(&:to_i).sum == 0
        redirect_to :back, :notice => "You did not select any tickets."
      end

      rescue ActionController::RedirectBackError
        redirect_to root_path
    end

    def total_cost
      @total_cost = 0
      @tickets.each do |k,v|
        ticket = TicketOffering.find(k)
        @total_cost += (ticket.price * v.to_i)
      end
    end
end

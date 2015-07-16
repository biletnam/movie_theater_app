class MovieTheatersController < ApplicationController
  before_action :set_movie_theater, only: [:edit, :update, :destroy, :dashboard, :sales_dashboard]

  def dashboard
  end

  def sales_dashboard
    if params[:movie_filter].present?
      @bookings = @movie_theater.bookings.where(:movie_id => params[:movie_filter]).page params[:page]
    else
      @bookings = @movie_theater.bookings.page params[:page]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @movie_theaters = MovieTheater.all
  end

  def show
    # FOR TESTING PURPOSES WILL ALWAYS USE FIRST
    @movie_theater = MovieTheater.first

    @day = params[:day] || Date.today
    @upcoming_dates = (Time.now.to_date..(Time.now + 5.days)).map{ |date| date }
    @showings = @movie_theater.showings.where(:date => @day)
    @movies = Movie.find(@showings.pluck(:movie_id))

  end

  def new
    @movie_theater = MovieTheater.new
  end

  def edit
  end

  def create
    @movie_theater = MovieTheater.new(movie_theater_params)

    respond_to do |format|
      if @movie_theater.save
        format.html { redirect_to @movie_theater, notice: 'Movie theater was successfully created.' }
        format.json { render :show, status: :created, location: @movie_theater }
      else
        format.html { render :new }
        format.json { render json: @movie_theater.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie_theater.update(movie_theater_params)
        format.html { redirect_to @movie_theater, notice: 'Movie theater was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_theater }
      else
        format.html { render :edit }
        format.json { render json: @movie_theater.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie_theater.destroy
    respond_to do |format|
      format.html { redirect_to movie_theaters_url, notice: 'Movie theater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_theater
      @movie_theater = MovieTheater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_theater_params
      params.require(:movie_theater).permit(:name, :address_1, :address_2, :city, :state, :zip, :phone)
    end
end

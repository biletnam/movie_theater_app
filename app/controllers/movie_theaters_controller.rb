class MovieTheatersController < ApplicationController
  before_action :set_movie_theater, only: [:edit, :update, :destroy, :dashboard, :sales_dashboard]

  def dashboard
  end

  def sales_dashboard
    if params[:movie_filter].present? && params[:movie_filter] != "All"
      @movie_id = params[:movie_filter]
      @bookings = @movie_theater.bookings.where(:movie_id => params[:movie_filter])
    else
      @movie_id = "All"
      @bookings = @movie_theater.bookings
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    # FOR TESTING PURPOSES WILL ALWAYS USE FIRST
    @movie_theater = MovieTheater.first

    @day = params[:day] || Time.current.to_date
    @upcoming_dates = (Time.current.to_date..(Time.current + 6.days)).map{ |date| date }
    @showings = @movie_theater.showings.where(:date => @day)
    @movies = Movie.find(@showings.pluck(:movie_id))
  end

  def edit
  end

  def create
    @movie_theater = MovieTheater.new(movie_theater_params)

    respond_to do |format|
      if @movie_theater.save
        format.html { redirect_to @movie_theater, notice: 'Movie theater was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  def update
    respond_to do |format|
      if @movie_theater.update(movie_theater_params)
        format.html { redirect_to theater_dashboard_url(@movie_theater), notice: 'Movie theater was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @movie_theater.destroy
    respond_to do |format|
      format.html { redirect_to movie_theaters_url, notice: 'Movie theater was successfully destroyed.' }
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

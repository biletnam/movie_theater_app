class MovieTheatersController < ApplicationController
  before_action :set_movie_theater, only: [:show, :edit, :update, :destroy]

  # GET /movie_theaters
  # GET /movie_theaters.json
  def index
    @movie_theaters = MovieTheater.all
  end

  # GET /movie_theaters/1
  # GET /movie_theaters/1.json
  def show
  end

  # GET /movie_theaters/new
  def new
    @movie_theater = MovieTheater.new
  end

  # GET /movie_theaters/1/edit
  def edit
  end

  # POST /movie_theaters
  # POST /movie_theaters.json
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

  # PATCH/PUT /movie_theaters/1
  # PATCH/PUT /movie_theaters/1.json
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

  # DELETE /movie_theaters/1
  # DELETE /movie_theaters/1.json
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

class ScreeningRoomsController < ApplicationController
  before_action :set_screening_room, only: [:show, :edit, :update, :destroy]

  # GET /screening_rooms
  # GET /screening_rooms.json
  def index
    @screening_rooms = ScreeningRoom.all
    @screening_room = ScreeningRoom.new
  end

  # GET /screening_rooms/1
  # GET /screening_rooms/1.json
  def show
  end

  # GET /screening_rooms/new
  def new
    @screening_room = ScreeningRoom.new
  end

  # GET /screening_rooms/1/edit
  def edit
  end

  # POST /screening_rooms
  # POST /screening_rooms.json
  def create
    @screening_room = ScreeningRoom.new(screening_room_params)

    respond_to do |format|
      if @screening_room.save
        format.html { redirect_to screening_rooms_url, notice: 'Screening room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /screening_rooms/1
  # PATCH/PUT /screening_rooms/1.json
  def update
    respond_to do |format|
      if @screening_room.update(screening_room_params)
        format.html { redirect_to screening_rooms_url, notice: 'Screening room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /screening_rooms/1
  # DELETE /screening_rooms/1.json
  def destroy
    @screening_room.destroy
    respond_to do |format|
      format.html { redirect_to screening_rooms_url, notice: 'Screening room was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screening_room
      @screening_room = ScreeningRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screening_room_params
      params.require(:screening_room).permit(:theater_number, :seat_quantity, :movie_theater_id)
    end
end

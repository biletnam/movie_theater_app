require 'test_helper'

class ScreeningRoomsControllerTest < ActionController::TestCase
  setup do
    @screening_room = screening_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:screening_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create screening_room" do
    assert_difference('ScreeningRoom.count') do
      post :create, screening_room: { movie_theater_id: @screening_room.movie_theater_id, seat_quantity: @screening_room.seat_quantity, theater_number: @screening_room.theater_number }
    end

    assert_redirected_to screening_room_path(assigns(:screening_room))
  end

  test "should show screening_room" do
    get :show, id: @screening_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @screening_room
    assert_response :success
  end

  test "should update screening_room" do
    patch :update, id: @screening_room, screening_room: { movie_theater_id: @screening_room.movie_theater_id, seat_quantity: @screening_room.seat_quantity, theater_number: @screening_room.theater_number }
    assert_redirected_to screening_room_path(assigns(:screening_room))
  end

  test "should destroy screening_room" do
    assert_difference('ScreeningRoom.count', -1) do
      delete :destroy, id: @screening_room
    end

    assert_redirected_to screening_rooms_path
  end
end

require 'test_helper'

class MovieTheatersControllerTest < ActionController::TestCase
  setup do
    @movie_theater = movie_theaters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_theaters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_theater" do
    assert_difference('MovieTheater.count') do
      post :create, movie_theater: { address_1: @movie_theater.address_1, address_2: @movie_theater.address_2, city: @movie_theater.city, name: @movie_theater.name, phone: @movie_theater.phone, state: @movie_theater.state, zip: @movie_theater.zip }
    end

    assert_redirected_to movie_theater_path(assigns(:movie_theater))
  end

  test "should show movie_theater" do
    get :show, id: @movie_theater
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_theater
    assert_response :success
  end

  test "should update movie_theater" do
    patch :update, id: @movie_theater, movie_theater: { address_1: @movie_theater.address_1, address_2: @movie_theater.address_2, city: @movie_theater.city, name: @movie_theater.name, phone: @movie_theater.phone, state: @movie_theater.state, zip: @movie_theater.zip }
    assert_redirected_to movie_theater_path(assigns(:movie_theater))
  end

  test "should destroy movie_theater" do
    assert_difference('MovieTheater.count', -1) do
      delete :destroy, id: @movie_theater
    end

    assert_redirected_to movie_theaters_path
  end
end

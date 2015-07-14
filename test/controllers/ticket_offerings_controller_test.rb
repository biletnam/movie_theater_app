require 'test_helper'

class TicketOfferingsControllerTest < ActionController::TestCase
  setup do
    @ticket_offering = ticket_offerings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_offerings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_offering" do
    assert_difference('TicketOffering.count') do
      post :create, ticket_offering: { movie_theater_id: @ticket_offering.movie_theater_id, name: @ticket_offering.name, price: @ticket_offering.price }
    end

    assert_redirected_to ticket_offering_path(assigns(:ticket_offering))
  end

  test "should show ticket_offering" do
    get :show, id: @ticket_offering
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket_offering
    assert_response :success
  end

  test "should update ticket_offering" do
    patch :update, id: @ticket_offering, ticket_offering: { movie_theater_id: @ticket_offering.movie_theater_id, name: @ticket_offering.name, price: @ticket_offering.price }
    assert_redirected_to ticket_offering_path(assigns(:ticket_offering))
  end

  test "should destroy ticket_offering" do
    assert_difference('TicketOffering.count', -1) do
      delete :destroy, id: @ticket_offering
    end

    assert_redirected_to ticket_offerings_path
  end
end

require 'test_helper'

class StockStatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_state" do
    assert_difference('StockState.count') do
      post :create, :stock_state => { }
    end

    assert_redirected_to stock_state_path(assigns(:stock_state))
  end

  test "should show stock_state" do
    get :show, :id => stock_states(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => stock_states(:one).to_param
    assert_response :success
  end

  test "should update stock_state" do
    put :update, :id => stock_states(:one).to_param, :stock_state => { }
    assert_redirected_to stock_state_path(assigns(:stock_state))
  end

  test "should destroy stock_state" do
    assert_difference('StockState.count', -1) do
      delete :destroy, :id => stock_states(:one).to_param
    end

    assert_redirected_to stock_states_path
  end
end

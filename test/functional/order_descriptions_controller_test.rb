require 'test_helper'

class OrderDescriptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_description" do
    assert_difference('OrderDescription.count') do
      post :create, :order_description => { }
    end

    assert_redirected_to order_description_path(assigns(:order_description))
  end

  test "should show order_description" do
    get :show, :id => order_descriptions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => order_descriptions(:one).to_param
    assert_response :success
  end

  test "should update order_description" do
    put :update, :id => order_descriptions(:one).to_param, :order_description => { }
    assert_redirected_to order_description_path(assigns(:order_description))
  end

  test "should destroy order_description" do
    assert_difference('OrderDescription.count', -1) do
      delete :destroy, :id => order_descriptions(:one).to_param
    end

    assert_redirected_to order_descriptions_path
  end
end

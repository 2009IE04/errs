require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post :create, :purchase => { }
    end

    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should show purchase" do
    get :show, :id => purchases(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => purchases(:one).to_param
    assert_response :success
  end

  test "should update purchase" do
    put :update, :id => purchases(:one).to_param, :purchase => { }
    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete :destroy, :id => purchases(:one).to_param
    end

    assert_redirected_to purchases_path
  end
end

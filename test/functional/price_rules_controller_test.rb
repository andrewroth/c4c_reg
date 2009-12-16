require 'test_helper'

class PriceRulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:price_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create price_rule" do
    assert_difference('PriceRule.count') do
      post :create, :price_rule => { }
    end

    assert_redirected_to price_rule_path(assigns(:price_rule))
  end

  test "should show price_rule" do
    get :show, :id => price_rules(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => price_rules(:one).to_param
    assert_response :success
  end

  test "should update price_rule" do
    put :update, :id => price_rules(:one).to_param, :price_rule => { }
    assert_redirected_to price_rule_path(assigns(:price_rule))
  end

  test "should destroy price_rule" do
    assert_difference('PriceRule.count', -1) do
      delete :destroy, :id => price_rules(:one).to_param
    end

    assert_redirected_to price_rules_path
  end
end

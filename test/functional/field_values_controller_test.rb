require 'test_helper'

class FieldValuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:field_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field_value" do
    assert_difference('FieldValue.count') do
      post :create, :field_value => { }
    end

    assert_redirected_to field_value_path(assigns(:field_value))
  end

  test "should show field_value" do
    get :show, :id => field_values(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => field_values(:one).to_param
    assert_response :success
  end

  test "should update field_value" do
    put :update, :id => field_values(:one).to_param, :field_value => { }
    assert_redirected_to field_value_path(assigns(:field_value))
  end

  test "should destroy field_value" do
    assert_difference('FieldValue.count', -1) do
      delete :destroy, :id => field_values(:one).to_param
    end

    assert_redirected_to field_values_path
  end
end

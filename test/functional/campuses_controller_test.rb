require 'test_helper'

class CampusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campus" do
    assert_difference('Campus.count') do
      post :create, :campus => { }
    end

    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should show campus" do
    get :show, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => campuses(:one).to_param
    assert_response :success
  end

  test "should update campus" do
    put :update, :id => campuses(:one).to_param, :campus => { }
    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should destroy campus" do
    assert_difference('Campus.count', -1) do
      delete :destroy, :id => campuses(:one).to_param
    end

    assert_redirected_to campuses_path
  end
end

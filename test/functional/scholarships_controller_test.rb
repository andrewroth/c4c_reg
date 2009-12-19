require 'test_helper'

class ScholarshipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholarships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholarship" do
    assert_difference('Scholarship.count') do
      post :create, :scholarship => { }
    end

    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should show scholarship" do
    get :show, :id => scholarships(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => scholarships(:one).to_param
    assert_response :success
  end

  test "should update scholarship" do
    put :update, :id => scholarships(:one).to_param, :scholarship => { }
    assert_redirected_to scholarship_path(assigns(:scholarship))
  end

  test "should destroy scholarship" do
    assert_difference('Scholarship.count', -1) do
      delete :destroy, :id => scholarships(:one).to_param
    end

    assert_redirected_to scholarships_path
  end
end

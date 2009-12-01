require 'test_helper'

class CashTransactionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_transaction" do
    assert_difference('CashTransaction.count') do
      post :create, :cash_transaction => { }
    end

    assert_redirected_to cash_transaction_path(assigns(:cash_transaction))
  end

  test "should show cash_transaction" do
    get :show, :id => cash_transactions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cash_transactions(:one).to_param
    assert_response :success
  end

  test "should update cash_transaction" do
    put :update, :id => cash_transactions(:one).to_param, :cash_transaction => { }
    assert_redirected_to cash_transaction_path(assigns(:cash_transaction))
  end

  test "should destroy cash_transaction" do
    assert_difference('CashTransaction.count', -1) do
      delete :destroy, :id => cash_transactions(:one).to_param
    end

    assert_redirected_to cash_transactions_path
  end
end

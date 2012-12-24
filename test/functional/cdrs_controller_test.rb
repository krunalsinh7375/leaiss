require 'test_helper'

class CdrsControllerTest < ActionController::TestCase
  setup do
    @cdr = cdrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cdrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cdr" do
    assert_difference('Cdr.count') do
      post :create, cdr: { case_no: @cdr.case_no, lac: @cdr.lac, mobile_no: @cdr.mobile_no, name: @cdr.name }
    end

    assert_redirected_to cdr_path(assigns(:cdr))
  end

  test "should show cdr" do
    get :show, id: @cdr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cdr
    assert_response :success
  end

  test "should update cdr" do
    put :update, id: @cdr, cdr: { case_no: @cdr.case_no, lac: @cdr.lac, mobile_no: @cdr.mobile_no, name: @cdr.name }
    assert_redirected_to cdr_path(assigns(:cdr))
  end

  test "should destroy cdr" do
    assert_difference('Cdr.count', -1) do
      delete :destroy, id: @cdr
    end

    assert_redirected_to cdrs_path
  end
end

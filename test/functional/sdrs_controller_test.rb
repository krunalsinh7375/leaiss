require 'test_helper'

class SdrsControllerTest < ActionController::TestCase
  setup do
    @sdr = sdrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sdrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sdr" do
    assert_difference('Sdr.count') do
      post :create, sdr: { address: @sdr.address, date: @sdr.date, mobile_number: @sdr.mobile_number, name: @sdr.name, sp: @sdr.sp }
    end

    assert_redirected_to sdr_path(assigns(:sdr))
  end

  test "should show sdr" do
    get :show, id: @sdr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sdr
    assert_response :success
  end

  test "should update sdr" do
    put :update, id: @sdr, sdr: { address: @sdr.address, date: @sdr.date, mobile_number: @sdr.mobile_number, name: @sdr.name, sp: @sdr.sp }
    assert_redirected_to sdr_path(assigns(:sdr))
  end

  test "should destroy sdr" do
    assert_difference('Sdr.count', -1) do
      delete :destroy, id: @sdr
    end

    assert_redirected_to sdrs_path
  end
end

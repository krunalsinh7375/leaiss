require 'test_helper'

class RtosControllerTest < ActionController::TestCase
  setup do
    @rto = rtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rto" do
    assert_difference('Rto.count') do
      post :create, rto: { chasis_no: @rto.chasis_no, city: @rto.city, color: @rto.color, engine_no: @rto.engine_no, model_des: @rto.model_des, mv_no: @rto.mv_no, owner_address: @rto.owner_address, owner_name: @rto.owner_name, year: @rto.year }
    end

    assert_redirected_to rto_path(assigns(:rto))
  end

  test "should show rto" do
    get :show, id: @rto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rto
    assert_response :success
  end

  test "should update rto" do
    put :update, id: @rto, rto: { chasis_no: @rto.chasis_no, city: @rto.city, color: @rto.color, engine_no: @rto.engine_no, model_des: @rto.model_des, mv_no: @rto.mv_no, owner_address: @rto.owner_address, owner_name: @rto.owner_name, year: @rto.year }
    assert_redirected_to rto_path(assigns(:rto))
  end

  test "should destroy rto" do
    assert_difference('Rto.count', -1) do
      delete :destroy, id: @rto
    end

    assert_redirected_to rtos_path
  end
end

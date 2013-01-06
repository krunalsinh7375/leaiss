require 'test_helper'

class MscsControllerTest < ActionController::TestCase
  setup do
    @msc = mscs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mscs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msc" do
    assert_difference('Msc.count') do
      post :create, msc: { circle: @msc.circle, code: @msc.code, operator: @msc.operator }
    end

    assert_redirected_to msc_path(assigns(:msc))
  end

  test "should show msc" do
    get :show, id: @msc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @msc
    assert_response :success
  end

  test "should update msc" do
    put :update, id: @msc, msc: { circle: @msc.circle, code: @msc.code, operator: @msc.operator }
    assert_redirected_to msc_path(assigns(:msc))
  end

  test "should destroy msc" do
    assert_difference('Msc.count', -1) do
      delete :destroy, id: @msc
    end

    assert_redirected_to mscs_path
  end
end

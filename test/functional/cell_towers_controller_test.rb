require 'test_helper'

class CellTowersControllerTest < ActionController::TestCase
  setup do
    @cell_tower = cell_towers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cell_towers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cell_tower" do
    assert_difference('CellTower.count') do
      post :create, cell_tower: { address: @cell_tower.address, cell_id: @cell_tower.cell_id, cgi: @cell_tower.cgi, company: @cell_tower.company, lac: @cell_tower.lac, latitude: @cell_tower.latitude, longitude: @cell_tower.longitude, tower_type: @cell_tower.tower_type }
    end

    assert_redirected_to cell_tower_path(assigns(:cell_tower))
  end

  test "should show cell_tower" do
    get :show, id: @cell_tower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cell_tower
    assert_response :success
  end

  test "should update cell_tower" do
    put :update, id: @cell_tower, cell_tower: { address: @cell_tower.address, cell_id: @cell_tower.cell_id, cgi: @cell_tower.cgi, company: @cell_tower.company, lac: @cell_tower.lac, latitude: @cell_tower.latitude, longitude: @cell_tower.longitude, tower_type: @cell_tower.tower_type }
    assert_redirected_to cell_tower_path(assigns(:cell_tower))
  end

  test "should destroy cell_tower" do
    assert_difference('CellTower.count', -1) do
      delete :destroy, id: @cell_tower
    end

    assert_redirected_to cell_towers_path
  end
end

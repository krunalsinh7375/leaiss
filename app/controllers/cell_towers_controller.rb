class CellTowersController < ApplicationController
  autocomplete :cell_tower, :cell_id

  before_filter :authorize_person
  around_filter :wrap_in_search, :only => :show

  def show
    @cell_tower = CellTower.find_by_cell_id(params[:id])
    @json = @cell_tower.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cell_tower }
    end
  end

  def new
    @cell_tower = CellTower.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cell_tower }
    end
  end

  def fetch_cell_tower
    @cell_tower = CellTower.find_by_cell_id(params[:cell_id])
    if @cell_tower.nil?
      flash[:error] = "Please provide correct Details"
      redirect_to new_cell_tower_path
    else
      
      redirect_to cell_tower_path(@cell_tower)
    end
  end

  private

  def wrap_in_search
    search_detail = CellTower.find_by_cell_id(params[:id]) #|| Rto.find_by_chasis_no(params[:chasis_no]) || Rto.find_by_engine_no(params[:engine_no])
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, search_detail.cell_id, 'Cell-ID Search')
    yield
  end
  
end

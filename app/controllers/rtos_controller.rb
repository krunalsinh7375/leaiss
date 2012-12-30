class RtosController < ApplicationController
  autocomplete :rto, :mv_no
  autocomplete :rto, :chasis_no
  autocomplete :rto, :engine_no

  before_filter :authorize_person
  around_filter :wrap_in_search, :only => :show
  
  def show
    @rto = Rto.find_by_mv_no(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rto }
    end
  end
  
  def fetch_rto_details
    case params[:rto_search_field]
    when 'Motor Vehicle Number '
      detail = Rto.find_by_mv_no(params[:mv_no])
    when 'Chasis Number'
      detail = Rto.find_by_chasis_no(params[:chasis_no])
    when 'Engine Number'
      detail = Rto.find_by_engine_no(params[:engine_no])
    else
      detail = Rto.find_by_mv_no(params[:mv_no])
    end
    
    @rto_detail = detail
    if @rto_detail.nil?
        flash[:error] = "Please provide correct details"
        redirect_to new_rto_path
    else
      #code for add entry in activity table
      redirect_to rto_path(@rto_detail)
    end
  end

  private

  def wrap_in_search
    search_detail = Rto.find_by_mv_no(params[:id]) #|| Rto.find_by_chasis_no(params[:chasis_no]) || Rto.find_by_engine_no(params[:engine_no])
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, search_detail.mv_no, 'RTO Search')
    yield
  end
end

class RtosController < ApplicationController
  autocomplete :rto, :mv_no
  autocomplete :rto, :chasis_no
  autocomplete :rto, :engine_no

  before_filter :authorize_person
  
  # GET /rtos/1
  # GET /rtos/1.json
  def show
    @rto = Rto.find(params[:id])

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
        flash[:notice] = "Please provide correct details"
        redirect_to new_rto_path
    else
      #code for add entry in activity table
      redirect_to rto_path(@rto_detail)
    end
  end
end

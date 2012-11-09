class SdrsController < ApplicationController
  autocomplete :sdr, :mobile_number
  
  before_filter :authorize_person
  # GET /sdrs
  # GET /sdrs.json
  def index
    redirect_to new_sdr_path
    # @sdrs = Sdr.all
    # 
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @sdrs }
    # end
  end

  # GET /sdrs/1
  # GET /sdrs/1.json
  def show
    @sdr = Sdr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sdr }
    end
  end

  #custom method for searching sdr details
  def fetch_sdr
    @sdr = Sdr.find_by_mobile_number(params[:mobile_number])
    if @sdr.nil?
      flash[:notice] = "Please provide correct Mobile number"
      redirect_to new_sdr_path
    else
      #create activity_log entry
      current_user.activities.create_activity_log(current_user,request,Time.now, @sdr.mobile_number, 'search')
      
      redirect_to sdr_path(@sdr)
    end
  end

  #custom method for multiple sdr search.
  def fetch_multiple_sdrs
    all_mobile_numers = params[:mobile_number].split(',')
    @all_sdrs = []
    unless all_mobile_numers.blank?
      all_mobile_numers.each do |mobile|
        mobile = mobile.delete(' ')
        current_user.activities.create_activity_log(current_user,request,Time.now, mobile, 'search')
        @all_sdrs << Sdr.find_by_mobile_number(mobile)
      end
      @all_sdrs = @all_sdrs.compact
    end
    # redirect_to list_multiple_sdrs_details_sdrs_path
  end
end

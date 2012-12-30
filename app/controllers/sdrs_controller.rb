class SdrsController < ApplicationController
  autocomplete :sdr, :mobile_number
  
  before_filter :authorize_person
  around_filter :wrap_in_search, :only => [:show]
  around_filter :wrap_in_multiple_search, :only => [:fetch_multiple_sdrs]

  def index
    redirect_to new_sdr_path
  end

  def show
    @sdr = Sdr.find_by_mobile_number(params[:id])
    params[:mobile_number] = @sdr.mobile_number
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sdr }
    end
  end

  #custom method for searching sdr details
  def fetch_sdr
    @sdr = Sdr.find_by_mobile_number(params[:mobile_number])
    if @sdr.nil?
      flash[:error] = "Please provide correct Mobile number"
      redirect_to new_sdr_path
    else
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
        @all_sdrs << Sdr.find_by_mobile_number(mobile)
      end
      @all_sdrs = @all_sdrs.compact
    end
  end

  private

  def wrap_in_search
    search_detail = params[:mobile_number] || Sdr.find_by_mobile_number(params[:id]).try(:mobile_number)
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, search_detail, 'Search')
    yield
  end
  
  def wrap_in_multiple_search
    all_mobile_numbers = params[:mobile_number]
    searched_data =  all_mobile_numbers.split(',').join(", ")
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, searched_data, 'Multiple Search')
    yield
  end
  
end

class SdrsController < ApplicationController
  autocomplete :sdr, :mobile_number
  
  before_filter :authorize_person
  # GET /sdrs
  # GET /sdrs.json
  def index
    @sdrs = Sdr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sdrs }
    end
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
      redirect_to sdr_path(@sdr)
    end
  end
end

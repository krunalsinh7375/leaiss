class MscsController < ApplicationController
  autocomplete :msc, :code

  before_filter :authorize_person
  around_filter :wrap_in_search, :only => [:show]

  def index
    redirect_to new_msc_path
  end
  
  def show
    @msc = Msc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @msc }
    end
  end

  def new
    # raise params.inspect
    @msc = Msc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @msc }
    end
  end
  
  def fetch_msc_code
    @msc_code = Msc.find_by_code(params[:code])
    if @msc_code.nil?
      raise
      flash[:error] = "Please provide correct Mobile number"
      redirect_to new_msc_path
    else
      redirect_to msc_path(@msc_code)
    end
  end

  private

  def wrap_in_search
    search_detail = params[:code] || Msc.find_by_code(params[:id]).try(:code)
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, search_detail, 'MSC Search')
    yield
  end

end

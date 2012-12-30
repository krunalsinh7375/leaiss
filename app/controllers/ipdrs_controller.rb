class IpdrsController < ApplicationController
  
  before_filter :authorize_person
  around_filter :wrap_in_search, :only => [:ipdr_lookup]
  
  def index
    redirect_to new_ipdr_path
  end

  def ipdr_lookup
    unless params[:ip_or_url].nil?
      begin
        @response_data  = Whois.query(params[:ip_or_url])
      rescue Exception => e
        flash[:error] = "Please enter correct details"
        redirect_to new_ipdr_path
        # return false
      end
    else
      flash[:error] = "Please enter correct details"
      redirect_to new_ipdr_path
    end
  end

  private
  
  def wrap_in_search
    #create activity_log entry
    current_user.activities.create_activity_log(current_user,request,Time.now, params[:ip_or_url], 'IP/Domain lookup')
    yield
  end
end

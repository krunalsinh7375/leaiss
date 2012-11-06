class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def admin_user
    @admin_user ||= current_user.admin if session[:user_id]
  end
  
  def authorize_person
    redirect_to root_url if !current_user
  end
  
end

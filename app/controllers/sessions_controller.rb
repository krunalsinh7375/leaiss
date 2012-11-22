class SessionsController < ApplicationController
  
  def new
    redirect_to new_sdr_path if current_user
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      #create activity_log entry
      current_user.activities.create_activity_log(current_user,request,Time.now, nil, 'Login')
      redirect_to new_sdr_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end

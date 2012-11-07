class ActivitiesController < ApplicationController

  before_filter :authorize_person
  before_filter :check_admin_access

  # GET /activities
  # GET /activities.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activities = current_user.activities

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activities }
    end
  end

  private
  
  def check_admin_access
    redirect_to root_path unless admin_user
  end

end

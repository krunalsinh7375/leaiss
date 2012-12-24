class CdrsController < ApplicationController

  before_filter :authorize_person
  
  def index
    @cdrs = Cdr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cdrs }
    end
  end

  def show
    @cdr = Cdr.find(params[:id])
    @out_going_frequency    = @cdr.cdr_records.where("call_type = ?", 'MO').group("called_number")
    @terminating_frequency  = @cdr.cdr_records.where("call_type = ?", 'MT').group("calling_number")
    @out_going_msg_frequency = @cdr.cdr_records.where("call_type = ?", 'SO').group('called_number')
    @in_coming_msg_frequency = @cdr.cdr_records.where("call_type = ?", 'ST').group('calling_number')
    @call_forward_frequency  = @cdr.cdr_records.where("call_type = ?", 'CF')
    @cell_tower_frequency    = @cdr.cdr_records.group('first_cell_id')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cdr }
    end
  end

  def new
    require 'fileutils'
    @cdr = Cdr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cdr }
    end
  end

  def create
    @cdr = Cdr.new(params[:cdr])
    respond_to do |format|
      Cdr.transaction do
        if @cdr.save
          @cdr.cdr_records.import(params[:cdr][:file], @cdr.id)
          @cdr.update_attributes(:user_id => current_user.id)
          format.html { redirect_to @cdr, notice: 'Cdr was successfully created.' }
          format.json { render json: @cdr, status: :created, location: @cdr }
        else
          format.html { render action: "new" }
          format.json { render json: @cdr.errors, status: :unprocessable_entity }
        end
      end
    end
  end

end

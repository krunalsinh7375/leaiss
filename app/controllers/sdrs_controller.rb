class SdrsController < ApplicationController
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

  # GET /sdrs/new
  # GET /sdrs/new.json
  def new
    @sdr = Sdr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sdr }
    end
  end

  # GET /sdrs/1/edit
  def edit
    @sdr = Sdr.find(params[:id])
  end

  # POST /sdrs
  # POST /sdrs.json
  def create
    @sdr = Sdr.new(params[:sdr])

    respond_to do |format|
      if @sdr.save
        format.html { redirect_to @sdr, notice: 'Sdr was successfully created.' }
        format.json { render json: @sdr, status: :created, location: @sdr }
      else
        format.html { render action: "new" }
        format.json { render json: @sdr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sdrs/1
  # PUT /sdrs/1.json
  def update
    @sdr = Sdr.find(params[:id])

    respond_to do |format|
      if @sdr.update_attributes(params[:sdr])
        format.html { redirect_to @sdr, notice: 'Sdr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sdr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sdrs/1
  # DELETE /sdrs/1.json
  def destroy
    @sdr = Sdr.find(params[:id])
    @sdr.destroy

    respond_to do |format|
      format.html { redirect_to sdrs_url }
      format.json { head :no_content }
    end
  end
end

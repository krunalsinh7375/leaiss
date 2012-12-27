class CdrsController < ApplicationController

  before_filter :authorize_person
  
  def index
    @cdrs = Cdr.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cdrs }
    end
  end

  def show
    @cdr = Cdr.find(params[:id])
    @out_going_frequency      = @cdr.cdr_records.get_frequency('MO').group("called_number")
    @terminating_frequency    = @cdr.cdr_records.get_frequency('MT').group("calling_number")
    @out_going_msg_frequency  = @cdr.cdr_records.get_frequency('SO').group('called_number')
    @in_coming_msg_frequency  = @cdr.cdr_records.get_frequency('ST').group('calling_number')
    @call_forward_frequency   = @cdr.cdr_records.get_frequency('CF')
    @cell_tower_frequency     = @cdr.cdr_records.group('first_cell_id')

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

  def show_map
    @cdr = Cdr.find(params[:id])

    @array = []
    @polylines = []

    @cdr.cdr_records.order("call_date DESC").each do |cdr_rec|
      cell = CellTower.find_by_cgi(cdr_rec.first_cell_id)
      unless cell.nil?
        @array << {"description"=> "#{cell.try(:address)}", "title" => "#{cell.try(:cgi)}", "lng" =>  "#{cell.try(:longitude)}", "lat" => "#{cell.try(:latitude)}"} 
        unless (cell.latitude.eql?('#N/A') && cell.longitude.eql?('#N/A'))
          @polylines << {"lng" =>  "#{cell.try(:longitude)}", "lat" => "#{cell.try(:latitude)}" }
        end
      end
    end

    first_cell = CellTower.find_by_cgi(@cdr.cdr_records.first.first_cell_id)
    last_cell  = CellTower.find_by_cgi(@cdr.cdr_records.last.first_cell_id)

    @first_cell_json =  "#{first_cell.latitude}, #{first_cell.longitude}"
    @last_cell_json = "#{last_cell.latitude}, #{last_cell.longitude}"

    first = 1
    last = @cdr.cdr_records.count - 1
    all_traverse_points = @cdr.cdr_records[first..last]

    @all_trs = []
    all_traverse_points.each do |cell|
      cell = CellTower.find_by_cgi(cell.first_cell_id)
      unless cell.nil?
        unless (cell.latitude.eql?('#N/A') && cell.longitude.eql?('#N/A'))
          @all_trs << "#{cell.latitude}, #{cell.longitude}"
        end
      end
    end
    @all_trs = @all_trs.sort {|a, b| a <=> b}
  end

end

class CellTower < ActiveRecord::Base
  attr_accessible :address, :cell_id, :cgi, :company, :lac, :latitude, :longitude, :tower_type

  #below code is used to take mobile_number as primary key(in rest urls)
  def to_param
    cell_id
  end

end

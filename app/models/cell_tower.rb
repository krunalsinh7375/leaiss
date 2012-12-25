class CellTower < ActiveRecord::Base
  attr_accessible :address, :cell_id, :cgi, :company, :lac, :latitude, :longitude, :tower_type

  acts_as_gmappable

  #below code is used to take mobile_number as primary key(in rest urls)
  def to_param
    cell_id
  end

  def gmaps4rails_address
    self.address
  end

  def gmaps4rails_infowindow
    "#{self.address}"
  end

  def gmaps4rails_title
    # add here whatever text you desire
    "Cell-ID - #{self.cell_id}"
  end

end

class Sdr < ActiveRecord::Base
  attr_accessible :address, :activation_date, :mobile_number, :name, :sp

  #below code is used to take mobile_number as primary key(in rest urls)
  def to_param
    mobile_number
  end

end

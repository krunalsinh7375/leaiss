class Rto < ActiveRecord::Base
  attr_accessible :chasis_no, :city, :color, :engine_no, :model_des, :mv_no, :owner_address, :owner_name, :year

  #below code is used to take mobile_number as primary key(in rest urls)
  def to_param
    mv_no
  end

end

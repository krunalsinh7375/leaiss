class Cdr < ActiveRecord::Base
  attr_accessible :case_no, :user_id, :mobile_no, :name, :file
  attr_accessor :file

  belongs_to :user
  has_many :cdr_records
  
  validates_presence_of :file, :on => :create
  validates_presence_of :mobile_no, :on => :create
  
end

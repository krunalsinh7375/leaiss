class Activity < ActiveRecord::Base
  attr_accessible :browser_info, :ip_address, :name, :time_stamp, :user_id, :content
  
  belongs_to :user
  
  ACTIVITY_TYPES = { 
    :search   => 'Search',
    :login    => 'Login'}
  
  def self.create_activity_log(current_user, request_params, current_time, content, activity_type)
    # name = activity_type.eql?('search') ? ACTIVITY_TYPES[:search] : ACTIVITY_TYPES[:login]
    name = activity_type
    self.create(:name         => name,
                :user_id      => current_user.id,
                :ip_address   => request_params.remote_ip,
                :time_stamp   => current_time,
                :browser_info => request_params.env['HTTP_USER_AGENT'],
                :content      => content)
  end
  
end

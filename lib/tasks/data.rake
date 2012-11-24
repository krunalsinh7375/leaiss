namespace :data  do
  desc "create some fake data"
  task :rto_dump => :environment do
    records = [
               {:mv_no => "GJ06AB1591", :year => "2002", :owner_name => "dhruv prajapati", :owner_address => "95 Hig, Adarsh Duplex, Laxmipura", :city => 'Vadodara', :chasis_no => "100882", :engine_no => "4005325", :model_des => "Maruti WAGON R LX", :color => "red"},
               {:mv_no => "GJ06AB1592", :year => "2002", :owner_name => "roshan jha", :owner_address => "95 Hig, Adarsh Duplex, Laxmipura", :city => 'Vadodara', :chasis_no => "100882", :engine_no => "4005325", :model_des => "Maruti WAGON R LX", :color => "red"},
               {:mv_no => "GJ06AB1593", :year => "2002", :owner_name => "nilay mistry", :owner_address => "95 Hig, Adarsh Duplex, Laxmipura", :city => 'Vadodara', :chasis_no => "100882", :engine_no => "4005325", :model_des => "Maruti WAGON R LX", :color => "red"},
               {:mv_no => "GJ06AB1594", :year => "2002", :owner_name => "M.S dahiya", :owner_address => "95 Hig, Adarsh Duplex, Laxmipura", :city => 'Vadodara', :chasis_no => "100882", :engine_no => "4005325", :model_des => "Maruti WAGON R LX", :color => "red"}
               ]
               
    records.each do |record|
      Rto.create(record)
    end
  end

  task :cell_dumps => :environment do
    records = [
                {:cell_id => "10012", :lac => "102788", :cgi => "1027", :address => "AKSHAT AVENUE - Ahmedabad", :latitude => '172.565003', :longitude => "72.565003", :tower_type => "3G", :company => "TATA"},
                {:cell_id => "10013", :lac => "102788", :cgi => "1027", :address => "AKSHAT AVENUE - Ahmedabad", :latitude => '172.565003', :longitude => "72.565003", :tower_type => "3G", :company => "Reliance"},
                {:cell_id => "10014", :lac => "102788", :cgi => "1027", :address => "AKSHAT AVENUE - Ahmedabad", :latitude => '172.565003', :longitude => "72.565003", :tower_type => "3G", :company => "Vodaphone"}
              ]
    records.each do |record|
      CellTower.create(record)
    end
  end
end
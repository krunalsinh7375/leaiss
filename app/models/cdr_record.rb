class CdrRecord < ActiveRecord::Base
  attr_accessible :call_date, :call_type, :called_number, :calling_number, :cdr_id, :duration, :imei, :first_cell_id

  belongs_to :cdr
  
  def self.import(file, cdr_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      
      duration        = row["duration"].to_i
      calling_number  = (row["call_type"].eql?('MT') || row["call_type"].eql?('MO')) ? row["calling_number"].to_i : row["calling_number"]
      called_number   = row["called_number"].to_i
      imei            = row["imei"].to_i
      
      updated_row = {"call_date"      => row["call_date"],
                     "call_type"      => row["call_type"],
                     "calling_number" => calling_number,
                     "called_number"  => called_number,
                     "duration"       => duration,
                     "first_cell_id"   => row["first_cell_id"],
                     "imei"           => imei
                     }
                     
      cdr_record = find_by_id(row["id"]) || new
      cdr_record.cdr_id = cdr_id
      cdr_record.attributes = updated_row.to_hash.slice(*accessible_attributes)
      cdr_record.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end

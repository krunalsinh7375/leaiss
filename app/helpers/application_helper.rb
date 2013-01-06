module ApplicationHelper

  def calculate_progress_report_margin(highest_val)
    return (highest_val[1].to_f/100.to_f) + 0.5
  end

  def get_initial_digits(mobile_number)
    mobile_number = mobile_number.size.eql?(12) ? mobile_number[2..11] : mobile_number
    return mobile_number[0..3]
  end

end

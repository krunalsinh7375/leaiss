module ApplicationHelper

  def calculate_progress_report_margin(highest_val)
    return (highest_val[1].to_f/100.to_f) + 0.5
  end

end

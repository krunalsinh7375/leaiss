class CdrAnalysis < Prawn::Document
  def initialize(cdr)
    super(top_margin: 40)
    @cdr = cdr
    analysis_header
    line_items
    pagination
  end

  def analysis_header
    image "#{Rails.root}/app/assets/images/Logo coral 13-white.png", :position => :left, :height => 50, :width => 50
    text_box "Name : #{@cdr.name}", :size => 10, :at=> [75,680] 
    text_box "Mobile Number: #{@cdr.mobile_no}", :size => 10, :at=> [75,690] 
    text_box "Case Number: #{@cdr.case_no}", :size => 10, :at=> [75,700] 
    
  end

  def line_items
    move_down 20
    text "Cell Out Frequency", size: 14, style: :bold
    table out_going_frequency do
      row(0).font_style = :bold
      columns(0..2).align = :right
      self.row_colors  = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def out_going_frequency
    out_going_cdrs = @cdr.cdr_records.get_frequency('MO').group("called_number")
    
    [["Calling NUmber", "Called Number", "Frequency"]] +
    out_going_cdrs.count.sort {|x,y| y[1] <=> x[1] }.map do |map|
      [@cdr.mobile_no, map[0], map[1]]
    end
  end

  def pagination
    string = "page <page> of <total>"
    options = { :at => [bounds.right - 150, 0],
    :width => 150,
    :align => :right,
    :page_filter => (1..7),
    :start_count_at => 1,
    :color => "333333" }
    number_pages string, options
  end
end
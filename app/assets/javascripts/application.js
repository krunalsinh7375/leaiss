// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap

function update_search_filed(){
  var value = $("#rto_search_field :selected").text();

  if (value === "Motor Vehicle Number"){
    $("#mv_number").show();
    $("#chasis_number").hide();
    $("#engine_number").hide();
  }
  if (value === "Chasis Number"){
    $("#mv_number").hide();
    $("#chasis_number").show();
    $("#engine_number").hide();
  }
  if (value === "Engine Number"){
    $("#mv_number").hide();
    $("#chasis_number").hide();
    $("#engine_number").show();
  }
}

$('.call_out').live('click', function() {
  $('.mobile_in').hide();
  $('.mobile_sms_out').hide();
  $('.mobile_sms_in').hide();
  $('.all_cell_fre').hide();
  $('.mobile_out').show();
  $('.call_forward_detail').hde();
});

$('.call_in').live('click', function() {
  $('.mobile_out').hide();
  $('.mobile_sms_out').hide();
  $('.mobile_sms_in').hide();
  $('.all_cell_fre').hide();
  $('.mobile_in').show();
  $('.call_forward_detail').hde();
});

$('.sms_out').live('click', function() {
  $('.mobile_out').hide();
  $('.mobile_sms_out').show();
  $('.mobile_in').hide();
  $('.mobile_sms_in').hide();
  $('.all_cell_fre').hide();
  $('.call_forward_detail').hde();
});

$('.sms_in').live('click', function() {
  $('.mobile_out').hide();
  $('.mobile_sms_out').hide();
  $('.mobile_in').hide();
  $('.all_cell_fre').hide();
  $('.mobile_sms_in').show();
  $('.call_forward_detail').hde();
});

$('.cell_count').live('click', function() {
  $('.mobile_out').hide();
  $('.mobile_sms_out').hide();
  $('.mobile_in').hide();
  $('.all_cell_fre').show();
  $('.mobile_sms_in').hide();
  $('.call_forward_detail').hide();
});

$('.call_forward').live('click', function() {
  $('.mobile_out').hide();
  $('.mobile_sms_out').hide();
  $('.mobile_in').hide();
  $('.all_cell_fre').hide();
  $('.mobile_sms_in').hide();
  $('.call_forward_detail').show();
});

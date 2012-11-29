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
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.purr
//= require best_in_place
//= require_tree .


$(function() {

  $("#postings_search input").keyup(function() {
    $.get($("#postings_search").attr("action"), $("#postings_search").serialize(), null, "script");
    return false;
  });

  $("#reviews_search input").keyup(function() {
    $.get($("#reviews_search").attr("action"), $("#reviews_search").serialize(), null, "script");
    return false;
  });

  $('.dropdown-toggle').dropdown();

  $('input#student_major').typeahead( {name: 'planets', local: [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune" ] });

});


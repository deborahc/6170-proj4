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
//= require_tree .


$(function() {

  $("#postings_search input").keyup(function() {
    $.get($("#postings_search").attr("action"), $("#postings_search").serialize(), null, "script");
    return false;
  });

  $('input#student_major').typeahead( {name: 'planets', local: [ "Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune" ] });


  //Dropdown for the postings search bar
  $(".dropdown-toggle").dropdown();

  //Change search by "field" when a new "field" is selected
  $('#all')[0].addEventListener('click',function(){
  	$('#button-category').html("All <span class='caret'></span>")
  });
  $('#title')[0].addEventListener('click',function(){
  	$('#button-category').html("Title <span class='caret'></span>")
  });
  $('#description')[0].addEventListener('click',function(){
  	$('#button-category').html("Description <span class='caret'></span>")
  });
  $('#skill')[0].addEventListener('click',function(){
  	$('#button-category').html("Skill <span class='caret'></span>")
  });
  

});
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree
//= require moment
//= require fullcalendar
//= require fullcalendar/lang-all

$(document).ready(function(){

  $('#element_calendar').hide();
  $('.carousel').carousel();
  $('.parallax').parallax();

  $('#calendar').fullCalendar(
  {
      events: $('.url_json').html(),

      defaultDate: $('.start_date').html(),

      header:
      {
        left: '',
        center: 'title'
      },

      firstDay:1,
      theme:false,
      selectable:true,
      lang: 'fr-ch'
  });
})

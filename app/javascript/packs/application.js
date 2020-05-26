// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//require("stimulus-inline-edit");
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require("jquery");

require("src/cocoon");
require("moment");
require("fullcalendar");
require("trix");
require("@rails/actiontext");
require("choices.js");
require("src/vendors.min.js");


import "controllers";
import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';
import $ from 'jquery';
import selectize from 'selectize';
import * as Choices from 'choices.js'
global.$ = $;
global.jQuery = $;

// ============================================


// ============================================
 $(document).on('turbolinks:load', function() {
 
  $('#calendar').fullCalendar({
  //var calendar = $(this);
	schedulerLicenseKey : 'GPL-My-Project-Is-Open-Source',
	editable : true,
	selectable : true,
	selectHelper : true,
	header: {
	  left: 'prev,next today',
	  center: 'title',
	  right: 'month, agendaWeek, agendaDay'
	},
	scrollTime : '00:00',
	defaultDate : '2020-04-02',
	events : '/engagements.json',
	select: function(start, end){
	  $.getScript('/engagements/new', function(){
	    
	  });
	  //calendar.fullCalendar('unselect')
	}

  });  


/*function eventCalendar() {
  return $('#calendar').fullCalendar({ });
};
*/

/*function clearCalendar() {
  $('#calendar').fullCalendar('delete'); 
  $('#calendar').html('');
};*/




$('#remove_structure').click(function(event){
  event.preventDefault();
});
});

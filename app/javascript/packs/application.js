// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

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
//require("jquery-ui");
//require("materialize-css")
// jquery
import $ from 'jquery';

global.$ = $
global.jQuery = $
//require("materialize");
//require("material-icons");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//import 'formSelect';
//import 'sidenav';
//import "controllers";
import 'materialize-css/dist/js/materialize.js';
/*function eventCalendar() {
  return $('#calendar').fullCalendar({ });
};
*/

/*function clearCalendar() {
  $('#calendar').fullCalendar('delete'); 
  $('#calendar').html('');
};*/

  $(document).on('turbolinks:load', function(){
    $('.composer-autocomplete').autocomplete({
      data: {
        "Mozart": 'Mozart',
        "Beethoven": 'Beethoven',
        "Haydn": 'Haydn'
      },
    });

    

    $('select').formSelect();
    $('.datepicker').datepicker();
    $('.sidenav').sidenav();
    $('.collapsible').collapsible(
      {
        accordion: false
      });
/*    $(document).on('turbolinks:load', function(){
  eventCalendar();  
});*/


/*$(document).on('turbolinks:before-cache', clearCalendar);*/
      
  });
  

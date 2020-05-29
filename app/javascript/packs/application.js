// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
//require("stimulus_reflex");
require("@rails/activestorage").start();
require("channels");
require("jquery");
require("src/cocoon");
require("moment");
require("fullcalendar");
require("trix");
require("@rails/actiontext");
//require("selectize");
require("choices.js");
// require("datatables.net-dt");
//require("stimulus-inline-edit");
//require("jquery-ui");
//require("materialize-css")
// jquery
//import Choices from 'choices.js';
import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'
import $ from 'jquery';
import selectize from 'selectize';
import * as Choices from 'choices.js'

global.$ = $
global.jQuery = $


 $(document).on('turbolinks:load', function() {

 



  });  


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

/*    const Choices = require('choices.js');
  var singleFetch = new Choices('#mydemo', {
          searchPlaceholderValue: 'Search a structure',
          removeItemButton: true,
        })
          .setChoices(function() {
            return fetch(
              '/structures.json'
            )
              .then(function(response) {
                return response.json();
              })
              .then(function(data) {
                return data.map(function(release) {
                  return { label: release.title, value: release.id };
                });
              });
          });
          
})*/

$(document).on('turbolinks:load', function() {
    $('.collapsible').collapsible({
    accordion: false
  });
 /* const Choices = require('choices.js');
  var singleFetch = new Choices('#mydemo', {
          searchPlaceholderValue: 'Search a structure',
          removeItemButton: true,
        })
          .setChoices(function() {
            return fetch(
              '/structures.json'
            )
              .then(function(response) {
                return response.json();
              })
              .then(function(data) {
                return data.map(function(release) {
                  return { label: release.title, value: release.id };
                });
              });
          });*/
          
  $('.composer-autocomplete').autocomplete({
    data: {
      "Mozart": 'Mozart',
      "Beethoven": 'Beethoven',
      "Haydn": 'Haydn'
    },
  });

$('#remove_structure').click(function(event){
  event.preventDefault();
});


  $('select:not(#mydemo)').formSelect();
  //$('.datepicker').datepicker();
  $('.sidenav').sidenav();

  /*    $(document).on('turbolinks:load', function(){
    eventCalendar();  
  });*/


  /*$(document).on('turbolinks:before-cache', clearCalendar);*/

});

import "controllers"

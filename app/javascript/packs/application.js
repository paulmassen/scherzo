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
require("selectize");
//require("jquery-ui");
//require("materialize-css")
// jquery
import $ from 'jquery';
import selectize from 'selectize';
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

$(document).on('turbolinks:load', function() {
  $('.composer-autocomplete').autocomplete({
    data: {
      "Mozart": 'Mozart',
      "Beethoven": 'Beethoven',
      "Haydn": 'Haydn'
    },
  });


  $('#engagement_structure_ids').selectize({
    create: true,
    valueField: 'id',
    labelField: 'title',
    searchField: 'title',
    options: [],
    persist: false,
    loadThrottle: 600,
    allowEmptyOption: true,
    load: function(query, callback) {
        if (!query.length) return callback();
        $.ajax({
            url: '/structures.json',
            type: 'GET',
            dataType: 'json',
            data: {
                name: query,
                additionalDataIfRequired: 'Additional Data'
            },
            error: function() {
                callback();
            },
            success: function(res) {
                // you can apply any modification to data before passing it to selectize
                callback(res);
                console.log(res);
                // res is json response from server
                // it contains array of objects. Each object has two properties. In this case 'id' and 'Name'
                // if array is inside some other property of res like 'response' or something. than use this
                //callback(res.response);
            }
        });
    }
});  
  
$('#engagement_structure_ids')[0].selectize.on('item_add', function(value, $item){
  console.log("élément ajouté");
  //console.log(value);
  var myitem = this.options[value];
  console.log(this.options[value]);
  //console.log(this.options[value.title]);
  //console.log(this.options[value.address]);

  console.log("This is the item");
  $("#structures").append("\r\n <div class=\"col nested-fields s6 m6\">\r\n      <div class=\"card grey lighten-1\">\r\n        <div class=\"card-content white-text\">\r\n          <span class=\"card-title\">\r\n          <p>  <div class=\'nested-fields\'>\r\n    <div class=\"field\">\r\n      "+  myitem.title +"\r\n    \r\n    <\/div><\/span>\r\n    <div class=\"field\">\r\n    " + myitem.address + "\r\n    \r\n    <\/div>\r\n  <\/div><\/p>\r\n        <\/div>\r\n        <div class=\"card-action\">\r\n        <%= link_to_remove_association \'<i class=\"material-icons\">clear<\/i> Remove\'.html_safe, f %>\r\n    \r\n        <\/div>\r\n      <\/div>\r\n    <\/div>")
  console.log($item);
});

  //$('select:not(.selectize)').formSelect();
  $('.datepicker').datepicker();
  $('.sidenav').sidenav();
  $('.collapsible').collapsible({
    accordion: false
  });
  /*    $(document).on('turbolinks:load', function(){
    eventCalendar();  
  });*/


  /*$(document).on('turbolinks:before-cache', clearCalendar);*/

});

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import '../stylesheets/application'
import './bootstrap_custom.js'

// For our clock.
// Taken from: https://www.w3schools.com/js/tryit.asp?filename=tryjs_timing_clock
function startTime() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  $('#clock_div').html(h + ":" + m + ":" + s);
  var t = setTimeout(startTime, 500);
}

function checkTime(i) {
  // add zero in front of numbers < 10
  if (i < 10) {i = "0" + i};
  return i;
}

$(function() {
  if ($('#clock_div').length > 0 ) {
    startTime();
  }
});

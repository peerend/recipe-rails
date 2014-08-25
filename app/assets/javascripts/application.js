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
//= require bootstrap-sprockets

(function() {
 var nav = document.getElementById('nav'),
 anchor = nav.getElementsByTagName('a'),
 current = window.location.pathname.split('/')[1];
 for (var i = 0; i < anchor.length; i++) {
 if(anchor[i].href == current) {
 anchor[i].className = "active";
 }
 }
})();
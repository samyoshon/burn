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
//= require bootstrap-sprockets
//= require local_time
//= require jquery.slick
//= require trix
//= require_tree .

$(document).on('turbolinks:load', function() {
// carousel js
	$('.scroller').slick({
		infinite: true,
		arrows: true,
		slidesToShow: 1,
		slidesToScroll: 1
	});

// sidenav active
	$('div.list-group > a.list-group-item').click(function() {
		$('div.list-group > a').removeClass('active');
		$(this).addClass('active');
	});
});



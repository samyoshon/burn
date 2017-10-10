$(document).on('turbolinks:load', function() {
// carousel js
	$('.scroller').slick({
		infinite: true,
		arrows: true,
		slidesToShow: 1,
		slidesToScroll: 1
	});
});

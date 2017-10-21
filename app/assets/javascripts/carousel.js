$(document).on('turbolinks:load', function() {
// carousel js
	$('.scroller').slick({
		infinite: true,
		arrows: true,
		slidesToShow: 1,
		slidesToScroll: 1
	});

	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
		asNavFor: '.slider-nav'
	});
	
	$('.slider-nav').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		dots: true,
		centerMode: true,
		focusOnSelect: true
	});
			
});

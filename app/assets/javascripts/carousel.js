// $(document).ready(function() {
//     $(".owl-carousel").owlCarousel({
// 		items: 1,
// 		loop: true,
// 		margin: 30,
// 		nav: true,
// 		navText: ["<i class='fa fa-chevron-left'></i>",
//         "<i class='fa fa-chevron-right'></i>"],
//         navElement: "div",
//         navContainer: false,
//         navContainerClass: "owl-nav",
//         navClass: ["owl-prev", "owl-next"],
// 		smartSpeed:900
// 	});
// 	$(".owl-prev").html('<i class="fa fa-chevron-left"></i>');
// 	$(".owl-next").html('<i class="fa fa-chevron-right"></i>');
// });

$(document).ready(function() {
	$('.scroller').slick({
		dots: true,
		infinite: true,
		arrows: true,
		// appendArrows: $('.scroller'),
		slidesToShow: 1,
		slidesToScroll: 1
	});
});
$(document).on('turbolinks:load', function() {
    // $('.sidenav-filters-btn').click(function() {
    //     var display = $('.sidenav-container-main').css('display');

    //     if ( display === 'none' ) {
    //         $('.sidenav-container-main').show();
    //     } else {
    //         $('.sidenav-container-main').collapse('hide');
    //         $('.sidenav-container-main').hide();
    //     }
    // });

    $(window).resize(function(){
        togglePanel();
    });

    togglePanel();

    function togglePanel (){
        var w = $(window).width();
        if (w <= 769) {
            $('.sidenav-container-filters').show();
            $('.sidenav-categories').attr('id', 'collapseExample');
            $('.sidenav-categories').addClass('collapse');
            $('.sidenav-container-main').hide();
        } else {
            $('.sidenav-container-filters').hide();
            $('.sidenav-categories').removeAttr('id', 'collapseExample');
            $('.sidenav-categories').removeClass('collapse');
            $('.sidenav-container-main').show();
        }
    }
});
$(document).on("turbolinks:load", function() {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open');
  });

  // $('html').click(function(event) {
  //   let control = $('.offcanvas-collapse');
  //   if (control.hasClass('open')) {
  //     control.removeClass('open');
  //   }
  //   // $('.offcanvas-collapse').removeClass('open');
  // });
  $('[data-toggle="offcanvas"]').on('focusout', function() {
    $('.offcanvas-collapse').removeClass('open');
  });
});

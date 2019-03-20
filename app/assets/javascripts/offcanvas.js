$(document).on("turbolinks:load", function() {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open');
  });

  $('[data-toggle="offcanvas"]').on('focusout', function() {
    $('.offcanvas-collapse').removeClass('open');
  });
});

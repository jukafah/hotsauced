$(function () {
  $('.form-control').change(function (event) {
    let control = $(this);

    $.ajax({
      url: '/sauces/3/reviews/validate',
      type: 'POST',
      beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
      data: event.target.id + '=' + control.val(),
      success: function (data, textStatus, jqXHR) {
        if (data.valid && !control.hasClass('is-valid')) {
          control.removeClass('is-invalid');
          $(`#${data.field_name} + .invalid-tooltip`).remove();
          control.addClass('is-valid');
        } else {
          $(`#${data.field_name} + .invalid-tooltip`).remove();
          control.removeClass('is-valid');
          control.remove
          control.addClass('is-invalid');
          control.after(`<div class="invalid-tooltip">${data.message}</div>`);
        }
      }
    });
  });
});

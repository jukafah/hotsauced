$(document).on("turbolinks:load", function() {

  $('.form-control').change(function (event) {
    let form = $('.needs-validation');
    let url = form.data('validate');
    let model = form.data('model');
    let control = $(this);

    let data = {};
    let key = event.target.id;
    data[key] = control.val();
    let jsonData = {};
    jsonData[model] = data;

    $.ajax({
      url: url,
      type: 'POST',
      beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
      data: jsonData,
      success: function (data, textStatus, jqXHR) {
        if (data.valid && !control.hasClass('is-valid')) {
          control.removeClass('is-invalid');
          $(`#${data.field_name} + .invalid-tooltip`).remove();
          control.addClass('is-valid');
        } else {
          $(`#${data.field_name} + .invalid-tooltip`).remove();
          control.removeClass('is-valid');
          control.addClass('is-invalid');
          control.after(`<div class="invalid-tooltip">${data.message}</div>`);
        }
      }
    });
  });
});

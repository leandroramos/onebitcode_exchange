$(document).ready ->
  $('.btn-switch').click ->
    currency = $("#currency").val();
    currency_destination = $("#currency_destination").val();
    $('#currency').val(currency_destination);
    $('#currency_destination').val(currency);
    send();

  $('#quantity, #currency, #currency_destination').change ->
    send();

  send = ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          beforeSend: ->
            $('#result').val("Carregando...");
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;

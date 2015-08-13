$(document).on 'WebComponentsReady', ->
  input = $('paper-input')
  button = $('paper-button');
  greeting = $("#greeting")
  button.on 'click', ->
    greeting.text 'oh no, ' + input.val()

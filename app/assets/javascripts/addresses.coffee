# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ()->
  $("form.new_address").on "ajax:success", (event, data, status, xhr) ->
    $('#new-address-modal').modal('hide')
    # $('table tbody').append('<tr><td>' + data.title + '</td><td>' + data.content + '</td></tr>')
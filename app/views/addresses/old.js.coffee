# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
    $('#new-address-modal').modal('hide')
#     # $('table tbody').append('<tr><td>' + data.title + '</td><td>' + data.content + '</td></tr>')
# alert 'not valid.'
$('#new-address-modal').on('hidden.bs.modal', function () {
 location.reload();
})
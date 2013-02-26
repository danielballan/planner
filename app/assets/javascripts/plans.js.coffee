# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#plan_label_ids').chosen()
  $('.best_in_place').best_in_place()
  $(':checkbox').click ->
      $(this).closest('form').submit()

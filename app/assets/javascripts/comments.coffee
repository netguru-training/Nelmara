# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a.comment-link[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    comment = $("#comment_" + data.id)
    comment.find(".vote-count").text(data.votes)

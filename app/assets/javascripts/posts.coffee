# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a.post-link[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    post = $("#post_" + data.id)
    post.find(".vote-count").text(data.votes)
  $(".posts").on "click", ".add-comment", (e) ->
    e.preventDefault()
    $("#comment-form-" + $(@).data("post-id")).toggle()

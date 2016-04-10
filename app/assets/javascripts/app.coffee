$ ->
  $('a').on 'click', ->
    $('#main')
      .css('opacity', '0.4')

$(document).on 'turbolinks:load', ->
  $('a').on 'click', ->
    $('#main')
      .css('opacity', '0.4')

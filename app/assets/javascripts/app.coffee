init = ->
  $(document).on 'click',  'a', ->
    $('#main')
      .css('opacity', '0.4')
    $('#loader')
      .css('opacity', '1')

reinit = ->
  action = window.location.pathname.split('/')[1]
  if action == ''
    $('ul.nav li:first').addClass 'active'
  else
    $('ul.nav a[href="/' + action + '"]').parent().addClass 'active'
    $('ul.nav a[href="/' + action + '"]').parents('li').addClass 'active'

$ ->
  init()
  reinit()

$(document).on 'turbolinks:load', ->
  reinit()
init = ->
  $(document).on 'click',  'a', ->
    $('#main')
      .css('opacity', '0.4')
    $('#loader')
      .css('opacity', '1')

$ ->
  init()
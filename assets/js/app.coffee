$ ->
  $('#body').data 'scroll_left', $('#body').scrollLeft()
  $('#body').mousewheel (event, delta)->
    column_width = $('.content p', this).width()
    $(this).data('scroll_left', $(this).data('scroll_left') - delta * column_width)
    $(this).animate {
      scrollLeft: $(this).data('scroll_left')
    }, {
      duration: 1000,
      queue: false,
      complete: ->
        $(this).data 'scroll_left', $(this).scrollLeft()
    }
    console.log event, delta
  $('#body').scroll ->
    scroll_left = $('#body').scrollLeft()
    $('.leader').css('background-position', "#{scroll_left/2}px")

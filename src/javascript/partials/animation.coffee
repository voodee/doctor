# Animation show
if $(window).width() > 768

  animation_end = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'

  animateRecursion = (than, count, number) ->
    $.each [['right', 'Right'], ['left', 'Left']], (key, value) ->
      if ( $el = $(than).find('.animate-' + value[0] + (count - number)) ).length > 0
        $el.removeClass('invisible bounceIn' + value[1] + ' animated').addClass('bounceIn' + value[1] + ' animated').one animation_end, ->
          animateRecursion than, count, number - 1

        if ($el_children = $el.children('.download-store')).length > 0
          (($el_children) =>
            do -> 
              $el_children.each (el) ->
                return if $(this).hasClass 'initialization'
                $(this).addClass 'initialization'
                new (Waypoint.Inview)(
                  element: $(this)[0]
                  entered: (direction) =>
                    $(this).removeClass('invisible bounceIn animated').addClass('bounceIn animated').one animation_end, ->
                      $(this).removeClass('invisible bounceIn animated')
                  exit: (direction) =>    
                    $(this).addClass('invisible')
                  exited: (direction) =>    
                    $(this).addClass('invisible')
                )
          )($el_children)


  $('.animate-box').each (el) ->
    new (Waypoint.Inview) (
      element: if ($animate_check = $(this).find('.animate-check')).length > 0 then $animate_check[0] else $(this)[0]
      entered: (direction) =>
        return if $(this).hasClass 'initialization'
        $(this).addClass 'initialization'
        animateRecursion this, 10, 10
    )

# Animation show end
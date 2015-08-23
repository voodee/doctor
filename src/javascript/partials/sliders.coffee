# Sliders 

window.timeoutId = false
animation_end = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'

showSlide = (number) ->
  clearTimeout(window.timeoutId) if window.timeoutId 

  $('.buttons .buttons-item').removeClass('active').eq(number).addClass 'active'
  $('.slides-nav a').removeClass('active').eq(number).addClass 'active'

  ($slides_item = $('.slides-box .slides-item')).removeClass('active').eq(number).addClass('active')
  $slides_item.find('.slides-item-images').removeClass('bounceInRight animated').addClass('bounceInRight animated').one animation_end, ->
    $(this).removeClass('bounceInRight animated')
  $slides_item.find('.slides-text').removeClass('bounceInLeft animated').addClass('bounceInLeft animated').one animation_end, ->
    $(this).removeClass('bounceInLeft animated')

  window.timeoutId = setTimeout(showSlide, 5000, (number + 1) % $('.slides-nav a').length )  



$('.slides-box').each ->
  newHeight = 0
  $this = $(this)
  $.each $this.children(), ->
    newHeight = $(this).height() if $(this).height() > newHeight
  $this.height newHeight

# Top menu
buttons_item_number = 0
$('.buttons .buttons-item').each ->
  ((x) =>
    $(this).find('a').click (e) ->
      e.preventDefault()
      do ->
        showSlide x
  )(buttons_item_number)
  ++buttons_item_number


# Right menu
buttons_item_number = 0
$('.slides-nav a').each ->
  ((x) =>
    $(this).click (e) ->
      e.preventDefault()
      do ->
        showSlide x
  )(buttons_item_number)

  ++buttons_item_number

showSlide(0)

# Sliders end




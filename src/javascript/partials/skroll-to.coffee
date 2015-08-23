$('#scroll-to-how').click (e) ->
  e.preventDefault()
  $.scrollTo $('#how-title').offset().top - $('.navigation').height(), 1500
$('.navigation-logo, .footer-logo').click -> $.scrollTo 0, 800
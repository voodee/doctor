window.jQuery     = window.$ = require 'jquery'
plugin            = require 'plugin'
 

(($) ->
  if $('.royal_preloader').length
    require './lib/royal_preloader.min.js'
    Royal_Preloader.config
      mode: "logo"
      logo: "img/logo-mini.png"
      logo_size: [64, 66]
      showInfo: true
      opacity: 1
      showProgress: true
      showPercentage: true
      text_colour: '#ссс'
      background: '#ffffff'
) jQuery





$(document).ready ->
  require './lib/bootstrap.js'

  # Scroll Phone
  # skrollr = require './lib/skrollr.min.js'
  # skrollr.init();
  require './partials/skroll-phone'


  # Scroll To
  require './lib/jquery.scrollTo.js'
  require './partials/skroll-to'


  # Animation
  require './lib/waypoints.min.js'
  require './lib/inview.js'
  require './partials/animation'


  # Sliders
  require './partials/sliders'


  console.log 'Hi! I\'m doctor.'
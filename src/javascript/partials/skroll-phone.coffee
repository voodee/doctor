$how_phone = $('.how-phone')
$how_phone_img = $('.how-phone-img')
phone_top_start = $how_phone_img.offset().top - $how_phone.offset().top
$(window).scroll( =>
  yPos = phone_top_start + ( $(window).scrollTop() * .45 )
  yPos = 0 if yPos > 0
  $how_phone_img.css 'top': yPos + 'px'
).scroll()
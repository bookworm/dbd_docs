$(document).ready ->
  $('.register-link').click ->
    $(this).parent().parent().fadeOut(300).hide()   
    $('.register').fadeIn(300)

  $('.reset-pass-link').click ->
    $(this).parent().parent().fadeOut(300).hide()   
    $('.reset-pass').fadeIn(300)

  $('.back-to-login').click ->
    $(this).parent().parent().fadeOut(300).hide()   
    $('.login-form-wrap').fadeIn(300)
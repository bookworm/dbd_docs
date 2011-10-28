//= require jquery
//= require jquery.ujs 
//= require jquery.color
//= require jquery.easing
//= require jquery.scrollTo
//= require jquery.center      
#= require forms
#= require login.form
#= require menus

$(document).ready ->
  darkness = '<div id="darkness" style="display: none; cursor: pointer; opacity: 0; background:#000;
                  position:fixed; height:100%; width:100%; z-index:500;"></div>'
                  
  $('body').prepend(darkness)
  
  $('.link-to-top').click ->
    $.scrollTo('#logo', 800, { easing:'easeInQuad' }) 
    return false
    
  $('.popup .close').click ->
    $('#darkness').filter(':not(:animated)').animate({ "opacity": 0 }, 600).hide()
    if($(this).parent().hasClass('popup'))
      $(this).parent().fadeOut(600)
    else
      $(this).parent().parent().fadeOut(600)
    return false   
 
  $('#flash .close').click ->
    $(this).parent().fadeOut(300)
    return false
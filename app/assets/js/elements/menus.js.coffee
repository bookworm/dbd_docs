$(document).ready ->             
       
  $('li.login a').click ->  
    if($('#login-popup'))
      $('#login-popup').center()
      $('#login-popup').show()           
      $('#darkness').filter(':not(:animated)').show().animate({ "opacity": 0.2 }, 600)    
    return false  
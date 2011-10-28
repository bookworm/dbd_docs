//= require jquery.validate
//= require jquery.labelify
//= require jquery.password123  

(($) ->
  $.formThingy = (el, options) ->
    @$form = $ el   
    @$form.data "formThingy", @

    @init = =>
      @options = $.extend {}, $.formThingy.defaultOptions, options
      @
    @init()    
        
    @$form.children('input:not(:password)').labelify( text: "label")  
    @$form.children('input:password').password123()    
    @validator = @$form.validate()       
    
    @$form.showError = (error_msg) =>    
      error = "<div class='form-error alert-message error'><a class='close' href='#'>x</a>
        <div class='error-message'><p>#{error_msg}</p></div></div>"
      @$form.prepend(error)
    
    @$form.bind 'ajax:failure', (event, xhr, status) =>
      response = $.parseJSON(xhr.responseText)
      if $.isPlainObject(response)                
        # TEMP hack. Why the fuck wont my forms work?
        @$form.trigger('ajax:success', event, xhr, status) if response.success == true 
        unless response.success == true
          if response.errors
            @validator.showErrors(response.errors)
          else if response.message 
            @$form.showError response.message 
          else
            @$form.showError 'Form submission failed'  
    
    @$form.bind 'ajax:success', (event, xhr, status) =>
      response = $.parseJSON(xhr.responseText) 
      if @options.redirect_url == location.href   
        return location.reload()        
      else
        return location.replace(@options.redirect_url)
         
    $('.form-error .close').live 'click', (event) ->
      $(this).parent().fadeOut(300)

  $.formThingy.defaultOptions = 
    autocomplete: 'off'
    lang: 'en'      
    redirect_url: location.href   
    templates_path: 'templates'    

  $.fn.formThingy = (options) ->
    $.each @, (i, el) ->
      $el = $ el

      unless $el.data 'formThingy'
        $el.data 'formThingy', new $.formThingy el, options
)(jQuery)
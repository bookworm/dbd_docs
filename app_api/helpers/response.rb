DbdDocs.helpers do   
  
  def error_resp(obj, message=nil)
    status 400        
    if request.xhr?   
      content_type 'application/json'
      @resp[:success] = false
      @resp[:errors]  = obj.errors if message == nil
      @resp[:message] = message if message   
      halt 400, @resp.to_json    
    else 
      flash[:error] = obj.errors.full_messages if message == nil   
      flash[:error] = message if message
    end
  end 
  
  def success_resp(obj, message)    
    if request.xhr? 
      content_type 'application/json'
      @resp[:success] = true
      @resp[:message] = message   
      halt 200, @resp.to_json    
    else 
      flash[:notice] = message
    end       
  end
end
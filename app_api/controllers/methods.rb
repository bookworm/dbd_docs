DbdDocs.controllers :methods do 
  
  before(:show, :update, :source) do
    @method = Method.find_by_slug(params[:slug])  
    @klass = @method.klass 
    not_found unless @method
  end  
  
  get :show, :map => '/methods/:slug/' do 
    render "methods/show"
  end
  
  get :source, :map => '/methods/:slug/source' do      
    content_type = 'text/plain'               
    return @method.source 
  end     

  post :create, :map => '/methods' do   
    @method = Method.new(params[:method])
    if @method.save   
      success_resp(@method, 'Successfully saved the Method.')   
      redirect url(:methods, :show, :slug => @method.slug)
    else
      error_resp(@methods)
      redirect url(:methods, :new)
    end       
  end      
  
  put :update, :map => '/methods/:slug/' do      
    @method.update_attributes(params[:method])
    if @method.save   
      success_resp(@method, 'Successfully update the Method.')   
      redirect url(:methods, :show, :slug => @method.slug)
    else
      error_resp(@klass)
      redirect url(:methods, :new)
    end
  end
end
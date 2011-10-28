DbdApiDocs.controllers :klasses do 
  
  before(:source, :update, :show) do
    @klass = Klass.first(params[:slug])               
    not_found unless @klass
  end
  
  get :show, :map => '/classes/:slug/' do 
    render "klasses/show"
  end  
  
  get :source, :map => '/classes/:slug/source' do      
    content_type = 'text/plain'               
    return @klass.source 
  end
  
  post :create, :map => '/classes' do   
    @klass = Klass.new(params[:class])
    if @klass.save   
      success_resp(@klass, 'Successfully saved the Class.')   
      redirect url(:klasses, :show, :slug => @klass.slug)
    else
      error_resp(@klass)
      redirect url(:klasses, :new)
    end       
  end      
  
  put :update, :map => '/classes/:slug/' do      
    @klass.update_attributes(params[:klass])
    if @klass.save   
      success_resp(@klass, 'Successfully saved the Class.')   
      redirect url(:klasses, :show, :slug => @klass.slug)
    else
      error_resp(@klass)
      redirect url(:klasses, :new)
    end
  end 
end
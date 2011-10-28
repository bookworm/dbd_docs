DbdApiDocs.controllers :namespaces do   
  
  before(:source, :show, :update) do
    @namespace = Namespace.find_by_slug(params[:slug])     
    not_found unless @namespace
  end    
  
  before(:show) do
    @docs = @namespace.docs
  end
  
  get :show, :map => '/namespaces/:slug/' do 
    render "namespaces/show"
  end  
  
  get :source, :map => '/namespaces/:slug/source' do      
    content_type = 'text/plain'               
    return @namespace.source 
  end
  
  post :create, :map => '/namespaces' do   
    @namespace = Namespace.new(params[:namespace])
    if @namespace.save   
      success_resp(@namespace, 'Successfully saved the Namespace.')   
      redirect url(:namespaces, :show, :slug => @namespace.slug)
    else
      error_resp(@namespace)
      redirect url(:namespaces, :new)
    end       
  end      
  
  put :update, :map => '/namespaces/:slug/' do      
    @namespace.update_attributes(params[:namespace])
    if @namespace.save   
      success_resp(@namespace, 'Successfully saved the Namespace.')   
      redirect url(:namespaces, :show, :slug => @namespace.slug)
    else
      error_resp(@namespace)
      redirect url(:namespaces, :new)
    end
  end
end
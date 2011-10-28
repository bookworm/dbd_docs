DbdApiDocs.controllers :parameters do 
  
  before(:show, :source, :update) do
    @parameter = Parameter.find_by_slug(params[:slug])       
    not_found unless @parameter
  end
  
  get :show, :map => '/parameters/:slug/' do 
    render "parameters/show"
  end  
  
  get :source, :map => '/parameters/:slug/source' do      
    content_type = 'text/plain'               
    return @parameter.source 
  end
  
  post :create, :map => '/parameters' do   
    @parameter = Parameter.new(params[:parameter])
    if @parameter.save   
      success_resp(@parameter, 'Successfully saved the Parameter.')   
      redirect url(:parameters, :show, :slug => @parameter.slug)
    else
      error_resp(@parameter)
      redirect url(:parameters, :new)
    end       
  end      
  
  put :update, :map => '/parameters/:slug/' do      
    @parameter.update_attributes(params[:parameter])
    if @parameter.save   
      success_resp(@parameter, 'Successfully saved the Parameter.')   
      redirect url(:parameters, :show, :slug => @parameter.slug)
    else
      error_resp(@parameter)
      redirect url(:parameters, :new)
    end
  end
end
DbdDocs.controllers :parameters do 
  
  before() do
    @parameter = Parameter.first(:name)
  end
  
  get :source, :map => '/parameters/:name/source' do      
    content_type = 'text/plain'               
    return @parameter.source 
  end
end
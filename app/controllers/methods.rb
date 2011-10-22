DbdDocs.controllers :methods do 
  
  before() do
    @method = Klass.first(:name)
  end
  
  get :source, :map => '/methods/:name/source' do      
    content_type = 'text/plain'               
    return @method.source 
  end
end
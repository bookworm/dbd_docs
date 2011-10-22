DbdDocs.controllers :klasses do 
  
  before() do
    @klass = Klass.first(:name)
  end
  
  get :source, :map => '/klasses/:name/source' do      
    content_type = 'text/plain'               
    return @klass.source 
  end
end
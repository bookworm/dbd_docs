DbdDocs.controllers :projects do 
  
  before() do
    @project = Project.first(:name)
  end
  
  get :source, :map => '/projects/:name/source' do      
    content_type = 'text/plain'               
    return @project.source 
  end
end
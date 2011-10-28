DbdApiDocs.controllers :klasses do 
  
  before(:show, :update, :source) do
    @project = Project.first(:name => params[:name])
  end
  
  get :show, :map => '/projects/:name/' do 
    render "projects/show"
  end      
  
  get :index, :map => '/projects/' do 
    @projects = Project.all
    render "projects/index"
  end 
  
  get :source, :map => '/projects/:slug/source' do      
    content_type = 'text/plain'               
    return @project.source 
  end     
  
  post :create, :map => '/projects' do   
    @project = Project.new(params[:project])
    if @project.save   
      success_resp(@project, 'Successfully saved the Project.')   
      redirect url(:projects, :show, :slug => @project.slug)
    else
      error_resp(@projects)
      redirect url(:projects, :new)
    end       
  end      
  
  put :update, :map => '/projects/:name/' do      
    @project.update_attributes(params[:project])
    if @project.save   
      success_resp(@project, 'Successfully update the Project.')   
      redirect url(:projects, :show, :slug => @project.slug)
    else
      error_resp(@klass)
      redirect url(:projects, :new)
    end
  end
end
DbdDocs.controllers :main do      
  
  before(:index, :show) do
    @cats = Category.all
  end   
  
  before(:show) do
    @doc = Doc.find_by_slug(params[:slug])
  end
  
  get :index, :map => '/' do
    render "docs/index"
  end       
  
  get :show, :map => '/:cat/:slug' do
    render "docs/show"
  end
end
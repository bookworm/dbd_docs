class Codedoc
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Markdown   
  plugin MongoMapper::Plugins::Timestamps
   
  key :project_id,  ObjectId    
  key :parent_id,   ObjectId
  key :title,       String
  key :name,        String
  key :raw_docbloc, String
  key :desc,        String
  key :example,     String
  key :source,      String 
  key :format,      String    
  key :related,     Array   
  key :root,        Boolean, :default => false
  key :depth,       Integer, :default => 0           
  
  def url()
    case self.class
    when 'Klass'
      url(:klasses, :show, :project => self.project.name, :slug => self.slug)  
    when 'Namespace'
      url(:namespaces, :show, :project => self.project.name, :slug => self.slug)     
    when 'Method'                  
      url(:methods, :show, :project => self.project.name, :slug => self.slug)     
    when 'Parameter'
      url(:parameters, :show, :project => self.project.name, :slug => self.slug)     
    when 'Variable'
      url(:variables, :show, :project => self.project.name, :slug => self.slug)     
  end        
  
  def project()
    Project.first(:project_id => self.id)
  end   
  
  def docs()
    Codedoc.all(:parent_id => self.id)
  end    
  
  def children()
    return self.docs
  end
end
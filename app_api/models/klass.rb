class Klass < Codedoc 
  include MongoMapper::Document  
   
  # Keys
  key :method_ids,  Array
  key :filename,    String
  key :path,        String   
  key :namespace,   String                
  key :extends,     Array
  key :implements,  Array
  key :includes,    Array    
  key :related,     Array
  
  # Key Settings   
  markdown :desc, :parser => 'kramdown'  
  slug_key :name, :unique => false       
  
  ##
  # Sub docs. Stuff that returns other docs
  #
  
  def implements?()     
    return true if self[:implements].length > 0
  end    
  
  def implements()
    Klass.all(:name => self[:implements], :project_id => self.project_id)
  end     
  
  def extends?()     
    return true if self[:extends].length > 0
  end    
  
  def extends()
    Klass.all(:name => self[:extends], :project_id => self.project_id)
  end
  
  def has_related?()     
    return true if self[:related].length > 0
  end    
  
  def related()
    Klass.all(:name => self[:related], :project_id => self.project_id)
  end
  
  def generate_slug()   
    return false if self[self.class.slug_key].blank?
    slug = self[self.class.slug_key].parameterize.to_s
    slug = self[:namespace].parameterize.to_s + '-' + slug unless self.namespace.blank?     
    self.slug = slug
  end  
  
  ##
  # Setters
  #
  
  def namespace=(namespace)
    
  end
end
class Method < Codedoc
  include MongoMapper::Document  
         
  key :klass_id,   ObjectId
  key :doc_id,     ObjectId
  key :parameters, Array   
  key :returns,    String   
  key :related,     Array
  
  # Key Settings   
  markdown :desc, :returns, :parser => 'kramdown'  
  slug_key :name, :unique => false 
  
  ##
  # Sub docs. Stuff that returns other docs
  #  
  
  def has_klass?()
    return true unless self[:klass_id].empty?
  end 
  
  def has_parameters()   
     return true if self[:implements].length > 0
  end      
  
  def parameters()     
    Parameter.all(:name => self[:parameters], :project_id => self.project_id)
  end   
  
  def has_related?()     
    return true if self[:related].length > 0
  end    
  
  def related()
    Method.all(:name => self[:related], :project_id => self.project_id)
  end
    
  def klass()
    Klass.first({:id => self.klass_id})
  end        
  
  def generate_slug()   
    return false if self[self.class.slug_key].blank?
    slug = self[self.class.slug_key].parameterize.to_s    
    klass = self.klass  
    slug = klass.slug + '-' + slug if klass
    self.slug = slug
  end    
end
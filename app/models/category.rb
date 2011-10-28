class Category  
  include MongoMapper::Document      
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Markdown   
  plugin MongoMapper::Plugins::Timestamps
  
  # Keys
  key :title,         String
  key :name,          String 
  key :desc,          String    
  key :parent_cat_id, ObjectId    
  key :top,           Boolean :default => true 
  
  # Key Settings   
  markdown :desc, :parser => 'kramdown'  
  slug_key :title, :unique => false  
  
  def docs() 
    Doc.all(:cat_id => self.id)
  end      
  
  def cats() 
    Category.all(:parent_cat_id => self.id)
  end   
  
  def has_cats?()
    return true unless Category.all(:parent_cat_id => self.id).count < 1
    return false
  end
  
  def add_cat(props={})
    Category.new({:parent_cat_id => self.id}.merge!(props))
  end  
  
  def parent_cat_id=(id)
    self[:parent_cat_id] = id
    self[:top] = false
  end
end
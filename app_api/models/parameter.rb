class Parameter < Codedoc
  include MongoMapper::Document  
                                
  key :doc_id,        ObjectId
  key :method_id,     ObjectId
  key :default,       String
  key :type,          String  
  
  # Key Settings   
  markdown :desc, :parser => 'kramdown'  
  slug_key :name, :unique => false     
  
  def generate_slug()   
    return false if self[self.class.slug_key].blank?
    slug = self[self.class.slug_key].parameterize.to_s    
    method = self.method 
    slug = method.slug + '-' + slug if method
    self.slug = slug
  end
  
  def method() 
    Method.first(:id => self.method_id)
  end
end
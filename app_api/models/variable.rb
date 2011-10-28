class Variable < Codedoc
  include MongoMapper::Document  
                                
  key :default,       String
  key :type,          String   
  key :klass_id,      ObjectId
  
  # Key Settings   
  markdown :desc, :parser => 'kramdown'  
  slug_key :name, :unique => false    
  
  def generate_slug()   
    return false if self[self.class.slug_key].blank?
    slug = self[self.class.slug_key].parameterize.to_s    
    klass = self.klass  
    slug = klass.slug + '-' + slug if klass
    self.slug = slug
  end   
  
  def klass()
    Klass.first({:id => self.klass_id})
  end
end
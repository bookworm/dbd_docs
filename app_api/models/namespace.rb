class Namespace < Codedoc
  include MongoMapper::Document 
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Markdown   
  plugin MongoMapper::Plugins::Timestamps
    
  # Keys
  key :doc,   String        
  
  # Key Settings   
  markdown :desc, :doc, :parser => 'kramdown'  
  slug_key :name, :unique => false      
  
  def generate_slug()   
    return false if self[self.class.slug_key].blank?
    slug = self[self.class.slug_key].parameterize.to_s    
    self.slug = slug
  end
end
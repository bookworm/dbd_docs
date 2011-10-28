class Doc      
  include MongoMapper::Document
  include MongoMapperExt::Slugizer      
  include MongoMapperExt::Markdown   
  plugin MongoMapper::Plugins::Timestamps       
  
  # Keys      
  key :title,       String   
  key :body,        String
  key :category_id, String     
  
  # Key Settings   
  markdown :body, :parser => 'kramdown'
  slug_key :title, :unique => false  
end
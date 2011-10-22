class Klass  
  include MongoMapper::Document  
  include MongoMapperExt::Codedoc
  
  key :method_ids,  Array
  key :filename,    String
  key :path,        String   
  key :namespace,   String    
end
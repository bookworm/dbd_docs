class Parameter
  include MongoMapper::Document  
  include MongoMapperExt::Codedoc
                                
  key :doc_id,        ObjectId
  key :method_id,     ObjectId
  key :default,       String
  key :type,          String    
end
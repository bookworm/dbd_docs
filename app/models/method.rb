class Method
  include MongoMapper::Document  
  include MongoMapperExt::Codedoc
         
  key :klass_id,      ObjectId
  key :doc_id,        ObjectId
  key :parameter_ids, Array
end
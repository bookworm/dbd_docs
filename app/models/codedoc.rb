module MongoMapperExt
  module Codedoc
    def self.included(klass)
      klass.class_eval do   
        extend ClassMethods   
             
        key :project_id,  ObjectId
        key :title,       String
        key :name,        String
        key :docblock,    String
        key :desc,        String
        key :example,     String
        key :source,      String 
        key :format,      String    
        key :related,     Array 
      end   
    end
  end
end
class Project < Codedoc
  include MongoMapper::Document  
  include MongoMapperExt::Markdown   
  plugin MongoMapper::Plugins::Timestamps
                     
  key :title,        String   
  key :name,         String
  key :desc,         String 
  key :git_url,      String
  key :svn_url,      String  
  key :homepage_url, String 
  key :github_url,   String  
  
  # Key Settings   
  markdown :desc, :parser => 'kramdown'  
  
  def source()
    return self.git_url if sef[:git_url]                
    return self.svn_url if sef[:svn_url]
  end       
  
  def docs(opts={}) 
    Codedoc.all({:project_id => self.id}.merge!(opts))
  end
end
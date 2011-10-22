class Project
  include MongoMapper::Document  
                     
  key :title,        String   
  key :name,         String
  key :desc,         String 
  key :git_url,      String
  key :svn_url,      String  
  key :homepage_url, String 
  key :github_url,   String
  
  def source()
    return self.git_url if sef[:git_url]                
    return self.svn_url if sef[:svn_url]
  end
end
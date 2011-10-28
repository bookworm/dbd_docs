require 'padrino/sprockets'
class DbdApiDocs < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  
  # Authorizaition             
  register Padrino::Admin::AccessControl 
  # register OmniAuthInitializer  
  
  # Sessions                    
  set :sessions, false    
  set :session_id, 'dbd_club'
  Padrino.use Rack::Session::Redis          
  
  # Resources. JS, CSS handling ext
  register CompassInitializer
  register Padrino::Sprockets
  register Sinatra::Flash
    
  assets do    
    digest false  
    handle_stylesheets false  
    stylesheets_url 'css'
    javascripts_url 'js'  
    public_assets_folder '/'
    public_stylesheets_folder 'css'  
    public_javascripts_folder 'js'
    append_path '../app/assets/js'     
    append_path '../lib/assets/js'
    append_path '../vendor/assets/js' 
  end
end
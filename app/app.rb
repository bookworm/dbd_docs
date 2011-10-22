require 'padrino/sprockets'
class DbdDocs < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register CompassInitializer   
  register Padrino::Sprockets   
  
  enable :sessions
end
class DbdDocs < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register CompassInitializer

  enable :sessions
end
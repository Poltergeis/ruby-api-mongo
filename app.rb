require 'sinatra/base'
require 'json'
require_relative './src/persona/infrastructure/router.rb'

class App < Sinatra::Base

  configure do
    set :port,9000
  end

  use PersonaRouter

  run! if app_file == $0

end

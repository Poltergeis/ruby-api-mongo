require_relative './dependencies.rb'
require 'json'
require 'sinatra/base'

class PersonaRouter < Sinatra::Base

  before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*',
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
            'Access-Control-Allow-Headers' => 'Content-Type'
  end

  options '*' do
    response.headers['Allow'] = 'POST','GET','PUT','DELETE','OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
    200
  end

  post '/persona' do
    begin
      body = request.body.read
      data = JSON.parse(body) if request.content_type == 'application/json'
      args = {
        nombre: data['nombre'],
        edad: data['edad'].to_i,
        trabajo: data['trabajo'],
        mayorDeEdad: (data['edad'] > 18),
        ciudad: data['ciudad']
      }
      personaControllers = PersonaControllers.new()
      personaControllers.addPersonaController.launch(args)
    rescue => error
      puts error
      return nil
    end
  end

  get '/persona' do
    begin
      personaControllers = PersonaControllers.new()
      personaControllers.getPersonasController.launch()
    rescue => error
      puts error
      return nil
    end
  end


end

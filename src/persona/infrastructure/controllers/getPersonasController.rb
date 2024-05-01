require 'json'
require 'sinatra/base'
require_relative '../../application/getPersonasUseCase.rb'

class GetPersonasController

  def initialize(getPersonasUseCase)
    @getPersonasUseCase = getPersonasUseCase
  end

  def launch()
    begin
      personas = @getPersonasUseCase.go()
      return { success: true, personas: personas }.to_json
    rescue => error
      return { success: false, message: "error en el controlador de getPersonas. ERROR: #{error}" }.to_json
    end
  end

end

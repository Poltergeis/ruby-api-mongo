require 'sinatra/base'
require 'json'
require_relative '../../application/addPersonaUseCase.rb'

class AddPersonaController

  def initialize(addPersonaUseCase)
    @addPersonaUseCase = addPersonaUseCase
  end

  def launch(args)
    begin
      persona = @addPersonaUseCase.go(args)
      return { success: true, persona: persona }.to_json
    rescue => error
      return { success: false, message: "error en el controlador de addPersona. ERROR: #{error.message}" }.to_json
    end
  end

end

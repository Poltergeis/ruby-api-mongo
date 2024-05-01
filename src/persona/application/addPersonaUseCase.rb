require_relative '../domain/personaRepository.rb'
require 'json'

class AddPersonaUseCase

  def initialize(persona_repository)
    @persona_repository = persona_repository
  end

  def go(args)
    begin
      nombre = args[:nombre]
      edad = args[:edad]
      trabajo = args[:trabajo]
      mayorDeEdad = args[:mayorDeEdad]
      ciudad = args[:ciudad]
      persona = @persona_repository.addPersona(nombre,edad,trabajo,mayorDeEdad,ciudad)
      return persona
    rescue TypeError => type_error
      puts "TypeError en el caso de uso de addPersona. ERROR: #{type_error.class}"
      puts type_error.backtrace
      return nil
    rescue => error
      puts "error en el caso de uso de addPersona. ERROR: #{error.message}"
      return nil
    end
  end


end

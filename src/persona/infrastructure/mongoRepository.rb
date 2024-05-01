require 'json'
require 'mongo'
require_relative '../domain/personaRepository.rb'
require_relative '../domain/persona.rb'
require_relative '../../database/database.rb'

class PersonaMongoRepository < PersonaRepository

  attr_reader :collection

  def initialize()
    @client = Mongo::Client.new('mongodb://127.0.0.1:27017/Personas')
    @collection = @client[:personas]
  end

  def addPersona(nombre,edad,trabajo,mayorDeEdad,ciudad)
    begin
      persona = Persona.new(nombre,edad,trabajo,mayorDeEdad,ciudad)
      @collection.insert_one(persona.getDocument)
      return persona
    rescue => error
      puts "error en el repositorio persona de mongo. #{error}"
      return nil
    end
  end

  def getPersonas()
    begin
      documents = @collection.find.to_a
      return documents
    rescue => error
      puts error
      return nil
    end
  end

end

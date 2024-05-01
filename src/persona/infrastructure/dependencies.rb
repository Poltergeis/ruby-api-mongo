require 'json'
require_relative './controllers/addPersonaController.rb'
require_relative './controllers/getPersonasController.rb'

require_relative '../application/addPersonaUseCase.rb'
require_relative '../application/getPersonasUseCase.rb'

require_relative './mongoRepository.rb'

#personaMongoRepository = PersonaMongoRepository.new()

#addPersonaUseCase = AddPersonaUseCase.new(personaMongoRepository)
#getPersonasUseCase = GetPersonasUseCase.new(personaMongoRepository)

class PersonaControllers

  attr_reader :addPersonaController, :getPersonasController

  def initialize()
    personaMongoRepository = PersonaMongoRepository.new()

    addPersonaUseCase = AddPersonaUseCase.new(personaMongoRepository)
    getPersonasUseCase = GetPersonasUseCase.new(personaMongoRepository)

    @addPersonaController = AddPersonaController.new(addPersonaUseCase)
    @getPersonasController = GetPersonasController.new(getPersonasUseCase)
  end

end

#addPersonaController = AddPersonaController.new(addPersonaUseCase)
#getPersonasController = GetPersonasController.new(getPersonasUseCase)

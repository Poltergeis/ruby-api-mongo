require_relative '../domain/personaRepository.rb'

class GetPersonasUseCase

  def initialize(persona_repository)
    @persona_repository = persona_repository
  end

  def go()
    begin
      personas = @persona_repository.getPersonas()
      return personas
    rescue => error
      puts "error en el caso de uso de getPersonas. ERROR: #{error}"
      return nil
    end
  end

end

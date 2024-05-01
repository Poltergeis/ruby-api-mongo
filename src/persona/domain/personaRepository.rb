require_relative './persona.rb'

class PersonaRepository
  public

  def addPersona(nombre,edad,trabajo,mayorDeEdad,ciudad)
    puts "esta es la configuracion por defecto del metodo addPersona, has implementado incorrectamente la inyeccion de dependencias"
    return Persona.new("dafault",0,"default",false,"default")
  end

  def getPersonas()
    puts "esta es la configuracion por defecto del metodo getPersonas, has implementado incorrectamente la inyeccion de dependencias"
    return Persona.new("dafault",0,"default",false,"default")
  end

end

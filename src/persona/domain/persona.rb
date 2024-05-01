require 'json'

class Persona
  attr_reader :nombre,:edad,:trabajo,:mayorDeEdad,:ciudad
  def initialize(nombre,edad,trabajo,mayorDeEdad,ciudad)
    @nombre = nombre
    @edad = edad
    @trabajo = trabajo
    @mayorDeEdad = mayorDeEdad
    @ciudad = ciudad
  end

  def getDocument()
    return { nombre: @nombre,edad: @edad,trabajo: @trabajo,mayorDeEdad: @mayorDeEdad,ciudad: @ciudad }
  end

end

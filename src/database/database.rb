require 'mongo'

class Database
  def self.client
    @client ||= Mongo::Client.new('mongodb://127.0.0.1:27017/Personas')
  end
end

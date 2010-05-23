require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist
  #include Mongo
  attr_accessor :inbox, :db, :coll
  
  def initialize 
    @db = Mongo::Connection.new.db("bluplate")
    @coll = @db.collection("users")
    @inbox ||= []
  end
  # def save
  #     @coll.insert({"somthing" => "yes"})
  #   end
  
end
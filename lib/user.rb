require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist
  #include Mongo
  attr_accessor :email, :inbox, :db, :coll
  
  def initialize(email)
    @email = email
    @db = Mongo::Connection.new.db("bluplate")
    @coll = @db.collection("users")
    @inbox ||= []

  end
  def to_hash
    {"email" => @email, "inbox" => @inbox}
  end
  
end
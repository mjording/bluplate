require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist
  attr_accessor :email, :inbox
  
  def initialize(email)
    @email = email
    @inbox ||= []
  end
  
  def to_hash
    {"email" => @email, "inbox" => @inbox}
  end
  
  def self.find_by_email(email)
    DB.collection("users").find_one({"email" => email}).each{ |doc| doc.inspect }
  end
  
end
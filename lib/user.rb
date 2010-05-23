require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist::Base

  attr_accessor :email, :inbox
  
  def initialize(email)
    @email = email
    @inbox ||= []
  end
  
  def to_hash
    inbox_hash = @inbox.map{|task| task.to_hash}
    puts inbox_hash.inspect
    {"email" => @email, "inbox" => inbox_hash}
  end
  
  def self.find_by_email(email)
    user_hash = db.collection("users").find_one({"email" => email}).each{ |doc| doc.inspect }
    inbox = user_hash[:inbox]
    User.new(:email => email, :inbox => inbox)
  end
  
  def self.create(opts={})
    u = self.new(opts)
    u.save
    u
  end
  
end
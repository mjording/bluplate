require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist::Base

  attr_accessor :email, :inbox
  
  def initialize(opts={})
    
    @email = opts[:email]
    @inbox ||= []
  end
  
  def to_hash
    inbox_hash = @inbox.map{|task| task.to_hash}
    puts "WHAT IS IT #{inbox_hash.inspect}"
    {"email" => @email, "inbox" => inbox_hash}
  end
  
  def self.find_by_email(email)
    if user_h = db.collection("users").find_one({"email" => email}) 
      user_hash =  user_h.each{ |doc| doc.inspect }
    else
      user_hash = nil
    end
    puts "PUTS!!! #{user_hash}"
    inbox = user_hash[:inbox]
    User.new(:email => email, :inbox => inbox)
  end
  
  def self.create(opts={})
    puts "TELL US #{opts}"
    u = self.new(opts)
    u.save
    u
  end
  
end
require 'persist' 
require 'mongo'
require 'json'
class User
  include Persist::Base

  attr_accessor :email, :inbox
  
  def initialize(opts)
    
    @email = opts[:email]
    @inbox = opts[:inbox]
  end
  
  def to_hash
    #inbox_hash = @inbox.map{|task| task.to_hash}
    puts "WHAT IS IT #{@inbox.inspect}"
    {:email => @email, :inbox => @inbox }
  end
  
  def self.find_by_email(email)
    if user_h = db.collection("users").find_one({"email" => email}) 
      puts "I have a user_h"
      user_hash =  user_h.each{ |doc| doc.inspect }
    else
      puts "I have no user_h"
      user_hash = nil
    end
    inbox = user_hash ? user_hash["inbox"] : {}
    puts "PUTS!!! #{user_hash}"
    User.new(:email => email, :inbox => inbox)
  end
  
  def self.create(opts={})
    puts "TELL US #{opts}"
    u = self.new(opts)
    u.save
    u
  end
  
end
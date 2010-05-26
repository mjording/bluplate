require 'persist' 
require 'mongo'
require 'json'
module Bluplate
  class User
    include Persist::Base

    attr_accessor :email, :inbox, :workstream, :contacts
  
    def initialize(opts)
    
      @email = opts[:email]
      @inbox = opts[:inbox] || {}
      @contacts = opts[:contacts] || {}
      @workstream = opts[:workstream] || {}
    end
  
    def to_hash
      {:email => @email, :inbox => @inbox, :workstream => @workstream, :contacts => @contacts }
    end
  
    def self.find_by_email(email)
      if user_h = db.collection("users").find_one({"email" => email}) 
        user_hash =  user_h.each{ |doc| doc.inspect }
      else
        user_hash = nil
      end
      inbox = user_hash ? user_hash["inbox"] : {}
      User.new(:email => email, :inbox => inbox)
    end
  
    def self.create(opts={})
      u = self.new(opts)
      u.save
      u
    end
  
    def add_contacts(contacts)
    
    end
  end

end
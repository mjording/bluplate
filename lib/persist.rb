require 'rubygems'
require 'mongo'
require 'settings'
require 'json'
require 'active_support/inflector'

module Persist
  include Mongo
  DB = Mongo::Connection.new(Settings.mongo.host).db(Settings.mongo.db)
  def self.included(base)
    base.extend(ClassMethods)
  end
  module ClassMethods 
    def find_user_by_email(email)
      DB.collection("users").find_one({"email" => email}).each{ |doc| doc.inspect }
    end
  end
  def save
    DB.collection(self.class.to_s.downcase.pluralize).insert(self.to_hash)
  end 
  
end


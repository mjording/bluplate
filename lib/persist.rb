require 'rubygems'
require 'mongo'
require 'settings'
require 'json'
require 'active_support/inflector'

module Persist
  include Mongo
  DB = Mongo::Connection.new(Settings.mongo.host).db(Settings.mongo.db)

  def save
    DB.collection(self.class.to_s.downcase.pluralize).insert(self.to_hash)
  end 
  
end


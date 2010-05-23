require 'rubygems'
require 'mongo'
require 'settings'
require 'json'

module Persist
  include Mongo
  DB = Mongo::Connection.new(Settings.mongo.host).db(Settings.mongo.db)
  def self.included( base )
    base.include(InstanceMethods)
    
  end
  module InstanceMethods 
    
    def save
      # DB.collection(self.to_json)
       DB.collection(self.class.to_s.downcase).insert(self.to_hash)
    end 
  end
end


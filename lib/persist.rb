require 'rubygems'
require 'mongo'
require 'settings'
require 'json'
require 'active_support/inflector'

module Persist
  
  
  module Base
    
  #DB = Mongo::Connection.new(Settings.mongo.host).db(Settings.mongo.db)

    def save
      puts "DUDE #{self.to_hash.inspect}"
      self.class.db.collection(self.class.to_s.downcase.pluralize).insert(self.to_hash)
    end
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods    
      def db
        Persist.db
      end
    end
  end
  
  def db
    @db ||= begin
       Mongo::Connection.new(Settings.mongo.host).db(Settings.mongo.db)
    end
  end
  module_function :db
end


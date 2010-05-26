
module Bluplate
  class Task
    include Bluplate::Persist::Base
    attr_accessor :tags, :description, :user_email
  
    def initialize(user_email, description)
      @user_email = user_email
      @description = description
      @tags ||= {}
    end
  
    def to_hash
      {:tags => @tags, :user_email => @user_email, :description => @description}
    end
  
  end  
end
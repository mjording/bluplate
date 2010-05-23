require 'persist' 
class Task
  include Persist::Base
  attr_accessor :tags, :history, :description, :user_email
  
  def initialize(user_email, description)
    @user_email = user_email
    @description = description
    @tags ||= {}
    @history ||= {}
    
    
  end
  
  def to_hash
    {:tags => @tags, :history => @history, :description => @description}
  end
  
end  
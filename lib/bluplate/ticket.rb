module Bluplate
  class Ticket
  
    attr_accessor :task, :user_email
  
    def initialize(task, user_email)
      @task = task
      @user_email = user_email
    end
  
    def to_hash
      {:task => @task, :user_email => @user_email}
    end
  
  end
end
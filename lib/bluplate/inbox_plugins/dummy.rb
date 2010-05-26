module Bluplate
  
  class Dummy
    attr_accessor :tasks
    def initialize
      @tasks = []
    end
    def import
    
      0..10.each do 
        @tasks << Task.new("test@tester.com", "this is my task, there are many like it, but this one is mine")
      end
    
    end
  
  
  end

end
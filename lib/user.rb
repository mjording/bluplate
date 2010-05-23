class User
  attr_accessor :inbox
  
  def initialize 
    @inbox ||= []
  end
  
end
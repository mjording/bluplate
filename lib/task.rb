class Task
  attr_accessor :tags, :history
  
  def initialize
    @tags ||= []
    @history ||= []
  end
  
end  
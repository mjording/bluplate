class Task
  attr_accessor :tags, :history, :description
  
  def initialize(description)
    @description = description
    @tags ||= []
    @history ||= []
    
    
  end
  
  def to_hash
    {"tags" => @tags, "history" => @history, "description" => @description}
  end
  
end  
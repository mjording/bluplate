class Task
  attr_accessor :tags, :history, :description
  
  def initialize(description)
    @tags ||= []
    @history ||= []
    @description = description
    
  end
  
  def to_hash
    {"tags" => @tags, "history" => @history, "description" => @description}
  end
  
end  
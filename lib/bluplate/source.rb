Dir[File.join(File.dirname(__FILE__), "inbox_plugins","*","*.rb")].each do |plugin|
  require plugin
end

class Source
  
  
  
end
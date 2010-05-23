$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'bluplate'
require 'spec'
require 'spec/autorun'
require 'task'
require 'user'

Spec::Runner.configure do |config|
  
end

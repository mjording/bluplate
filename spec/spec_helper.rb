$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'bluplate'
require 'spec'
require 'spec/autorun'
require 'bluplate/persist'
require 'bluplate/task'
require 'bluplate/user'
require 'bluplate/ticket'
require 'bluplate/inbox'

Spec::Runner.configure do |config|
  
end

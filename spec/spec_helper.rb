$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'active_support/inflector'
require 'bluplate'
require 'bluplate/persist'
require 'bluplate/task'
require 'bluplate/user'
require 'bluplate/ticket'
require 'bluplate/inbox'

Spec::Runner.configure do |config|
  
end

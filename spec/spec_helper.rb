$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'columbo'
require 'rspec'
require 'rspec/autorun'
require 'mocha'

RSpec.configure do |config|
  config.mock_with :mocha 
end

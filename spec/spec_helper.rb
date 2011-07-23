require 'rubygems'
require 'bundler/setup'

require 'rspec-resque'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Resque.redis.namespace = "resque:RspecResque"

RSpec.configure do |config|
  config.before(:each) { RspecResque.reset! }
end
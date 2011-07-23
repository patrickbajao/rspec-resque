require 'rubygems'
require 'bundler/setup'

require 'rspec-resque'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  config.after(:each) { RspecResque.reset! }
end
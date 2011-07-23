require "resque"
require "rspec-resque/version"
require "rspec-resque/helpers"
require "rspec-resque/matchers"

module RspecResque
  extend self
  
  def reset!
    keys = Resque.redis.keys("*")
    Resque.redis.del(*keys) unless keys.empty?
  end
end

config = RSpec.configuration
config.include RspecResque::Helpers

World(RspecResque::Helpers) if defined?(World)
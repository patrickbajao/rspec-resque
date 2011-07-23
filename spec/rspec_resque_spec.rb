require 'spec_helper'

describe RspecResque do
  describe "::reset" do
    it "should remove resque related keys in redis" do
      Resque.enqueue(Job)
      RspecResque.reset!
      Resque.redis.keys("*").should be_empty
    end
    
    it "should not raise an error when there are no resque related keys" do
      expect { RspecResque.reset! }.to_not raise_error
    end
  end
end
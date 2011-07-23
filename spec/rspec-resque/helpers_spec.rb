require 'spec_helper'

describe RspecResque::Helpers do
  describe "#run_resque" do
    it "should perform job" do
      Job.should_receive(:perform)
      Resque.enqueue(Job)
      run_resque(:queue)
    end
  end
end
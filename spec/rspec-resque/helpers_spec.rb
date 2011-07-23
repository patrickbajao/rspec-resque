require 'spec_helper'

describe RspecResque::Helpers do
  describe "#run_resque" do
    it "should perform job" do
      Job.should_receive(:perform)
      Resque.enqueue(Job)
      run_resque(:queue)
    end
    
    context "job hooks" do
      before do
        Resque.enqueue(JobWithHooks)
        run_resque(:queue)
      end
      
      [:after_enqueue, :before_perform, :after_perform, :around_perform].each do |hook|
        it "should perform #{hook.to_s} hook" do
          Resque.redis.keys("#{hook.to_s}").should have_exactly(1).item
        end
      end
    end
  end
end
require 'spec_helper'

describe "RspecResque Matchers" do
  describe "#have_queued" do
    context "without arguments" do
      before { Resque.enqueue(Job) }
    
      subject { Job }
    
      it { should have_queued }
    end
    
    context "with arguments" do
      before { Resque.enqueue(JobWithArgs, 0, 10) }
    
      subject { JobWithArgs }
    
      it { should have_queued(0, 10) }
      it { should_not have_queued(10, 0) }
    end
  end
  
  describe "#have_queue_size_of" do
    before do
      Resque.enqueue(JobWithArgs, 0, 10)
      Resque.enqueue(JobWithArgs, 11, 20)
      Resque.enqueue(JobWithArgs, 21, 30)
    end
    
    subject { JobWithArgs }
    
    it { should have_queue_size_of(3) }
    it { should_not have_queue_size_of(1) }
  end
end
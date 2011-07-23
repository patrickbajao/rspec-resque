require 'spec_helper'

describe "RspecResque Matchers" do
  describe "#have_queued" do
    context "without arguments" do
      before { Resque.enqueue(Job) }
    
      subject { Job }
    
      it { should have_queued }
    end
    
    context "with arguments" do
      before { Resque.enqueue(Job, 0, 10) }
    
      subject { Job }
    
      it { should have_queued(0, 10) }
      it { should_not have_queued(10, 0) }
    end
  end
  
  describe "#have_queue_size_of" do
    before do
      Resque.enqueue(Job, 0, 10)
      Resque.enqueue(Job, 11, 20)
      Resque.enqueue(Job, 21, 30)
    end
    
    subject { Job }
    
    it { should have_queue_size_of(3) }
    it { should_not have_queue_size_of(1) }
  end
end
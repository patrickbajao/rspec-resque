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
end
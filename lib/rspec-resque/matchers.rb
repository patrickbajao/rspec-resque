require "rspec"

module MatcherHelper
  def queue(klass)
    Resque.peek(Resque.queue_from_class(klass).to_s, 0, 0)
  end
  
  def enqueued?(klass, expected_args)
    queue(klass).any? { |entry| entry["class"].to_s == klass.to_s && entry['args'] == expected_args }
  end
end

RSpec::Matchers.define :have_queued do |*expected_args|
  extend MatcherHelper
  
  match do |job|
    enqueued?(job, expected_args)
  end

  failure_message_for_should do |job|
    "expected that #{job} would have [#{expected_args.join(', ')}] queued"
  end

  failure_message_for_should_not do |job|
    "expected that #{job} would not have [#{expected_args.join(', ')}] queued"
  end

  description do
    "have queued arguments of [#{expected_args.join(', ')}]"
  end
end

RSpec::Matchers.define :have_queue_size_of do |size|
  extend MatcherHelper

  match do |job|
    queue(actual).size == size
  end

  failure_message_for_should do |job|
    "expected that #{job} would have #{size} entries queued, but got #{queue(job).size} instead"
  end

  failure_message_for_should_not do |job|
    "expected that #{job} would not have #{size} entries queued, but got #{queue(job).size} instead"
  end

  description do
    "have a queue size of #{size}"
  end
end

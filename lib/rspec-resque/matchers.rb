require "rspec"

RSpec::Matchers.define :have_queued do |*expected_args|
  match do |actual|
    Resque.peek(Resque.queue_from_class(actual).to_s, 0, 0).any? { |entry| entry["class"].to_s == actual.to_s && entry['args'] == expected_args }
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would have [#{expected_args.join(', ')}] queued"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would not have [#{expected_args.join(', ')}] queued"
  end

  description do
    "have queued arguments of [#{expected_args.join(', ')}]"
  end
end
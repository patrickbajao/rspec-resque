class Job
  @queue = :queue
  
  attr_accessor :runs
  
  def self.perform
    self.runs += 1
  end
end

class JobWithArgs
  @queue = :queue
  
  attr_accessor :runs
  
  def self.perform(start, finish)
    self.runs += 1
  end
end

class JobWithHooks
  @queue = :queue
  
  attr_accessor :runs
  
  def self.after_enqueue(*args)
    Resque.redis.setnx("after_enqueue", 1)
  end
  
  def self.before_perform(*args)
    Resque.redis.setnx("before_perform", 1)
  end
  
  def self.after_perform(*args)
    Resque.redis.setnx("after_perform", 1)
  end
  
  def self.around_perform(*args)
    Resque.redis.setnx("around_perform", 1)
  end
  
  def self.perform
    self.runs += 1
  end
end
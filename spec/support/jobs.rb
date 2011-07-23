class Job
  @queue = :queue
  
  attr_accessor :runs
  
  def self.perform
    self.runs += 1
  end
end
module RspecResque
  module Helpers
    
    def run_resque(queue)
      worker = Resque::Worker.new(queue)
      
      while(job = worker.reserve) do
        worker.working_on(job)
        worker.perform(job)
        worker.done_working
      end
    end
    
  end
end
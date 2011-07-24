# RspecResque

Simple Rspec matcher for Resque that is inspired by resque_spec (https://github.com/leshill/resque_spec). The difference is that this matcher uses Redis and does not simulate Resque.

## Matchers

### have_queued

To check if job is enqueued with specific arguments, you can use the `have_queued` matcher.

    Job.should have_queued(args)

### have_queue_size_of

To check the size of the queue of a job, you can use the `have_queue_size_of` matcher.

    Job.should have_queue_size_of(1)

## Running a Worker in Specs

To run a worker in a spec, you can call `run_resque` with the queue you want to be worked on.

    run_resque(:queue)

Example:

    describe "#calculate" do
      before do
        RspecResque.reset!
      end

      it "should calculate" do
        stats.calculate
        run_resque(:stats)
        stats.value == 100
      end
    end

## Clearing Resque Related Keys in Redis

To clear resque related keys in Redis that were created during the test, you can call `RspecResque.reset!`

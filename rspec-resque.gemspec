$:.push File.expand_path("../lib", __FILE__)
require "rspec-resque/version"

Gem::Specification.new do |s|
  s.name        = "rspec-resque"
  s.version     = Rspec::Resque::VERSION
  s.authors     = ["Patrick Bajao"]
  s.email       = ["earl.bajao@gmail.com"]
  s.homepage    = "https://github.com/patrickbajao/rspec-resque"
  s.summary     = "Rspec matchers for Resque."
  s.description = <<desc
Rspec matchers for Resque.
desc

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency('resque', ['~> 1.17.0'])
  s.add_runtime_dependency('rspec', ['~> 2.6.0'])
end

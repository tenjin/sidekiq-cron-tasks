$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sidekiq/cron/tasks/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sidekiq-cron-tasks"
  s.version     = Sidekiq::Cron::Tasks::VERSION
  s.authors     = ["Bernardo Farah"]
  s.email       = ["ber@bernardo.me"]
  s.homepage    = "https://github.com/coverhound/sidekiq-cron-tasks"
  s.summary     = "Adds tasks for Sidekiq Cron loading"
  s.description = "Adds tasks for Sidekiq Cron loading"
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "railties", "> 6.0"
  s.add_dependency "sidekiq-cron", '> 1.10'
end

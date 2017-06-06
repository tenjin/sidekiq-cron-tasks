module Sidekiq
  module Cron
    module Tasks
      class Railtie < ::Rails::Railtie
        rake_tasks do
          load "tasks/sidekiq_cron/tasks.rake"
        end
      end
    end
  end
end

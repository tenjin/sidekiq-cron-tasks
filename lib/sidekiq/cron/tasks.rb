require "sidekiq-cron"
require "sidekiq/cron/tasks/railtie"
require "sidekiq/cron/tasks/configuration"

module Sidekiq
  module Cron
    module Tasks
      def self.config
        @config ||= Configuration.new
      end

      def self.configure
        yield config
      end
    end
  end
end

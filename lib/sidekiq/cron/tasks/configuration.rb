module Sidekiq
  module Cron
    module Tasks
      class Configuration
        attr_accessor :file, :prefix

        def initialize
          @file = ::Rails.root.join("config", "sidekiq_cron.yml")
          @prefix = "sidekiq_cron"
        end

        def file
          @file || @default_file.call
        end

        def schedule
          @schedule ||= File.exist?(file) ? YAML.load_file(file).fetch(Rails.env, {}) : {}
        end
      end
    end
  end
end

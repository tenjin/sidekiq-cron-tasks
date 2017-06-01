require_relative 'boot'

require "rails"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)
require "sidekiq/cron/tasks"

module Dummy
  class Application < Rails::Application
  end
end

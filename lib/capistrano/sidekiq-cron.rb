
require "capistrano/rails/migrations"

load File.expand_path("../tasks/sidekiq_cron.rake", __FILE__)

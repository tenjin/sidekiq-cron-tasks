task :environment do
  # no-op -- expect Rails / outlying framework to define
end

namespace :sidekiq_cron do
  desc "Load Sidekiq Cron entries from file"
  task load: :environment do
    config = Sidekiq::Cron::Tasks.config

    next if config.schedule.empty?

    prefix = config.prefix
    prefixed_hash = config.schedule.each_with_object({}) do |(name, options), new_hash|
      prefixed_name = name.sub(/\A(#{prefix} )?/, prefix + " ")
      new_hash[prefixed_name] = options
    end

    # Only destroy jobs that are no longer present in the schedule. Others, if already existing, will just be updated.
    Sidekiq::Cron::Job.all
      .select { |job| job.name =~ /\A#{prefix} / }
      .reject { |job| prefixed_hash.key?(job.name) }
      .each(&:destroy)
    Sidekiq::Cron::Job.load_from_hash prefixed_hash
  end

  desc "Clear Sidekiq Cron entries"
  task clear: :environment do
    prefix = Sidekiq::Cron::Tasks.config.prefix
    Sidekiq::Cron::Job.all.select { |job| job.name =~ /\A#{prefix} / }.each(&:destroy)
  end
end

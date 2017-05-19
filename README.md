# Sidekiq::Cron::Tasks

Adds `rake` and `cap` tasks for loading `Sidekiq::Cron::Job`s from a config
file.

## Usage

#### Rake task

You can run the rake task via:

```sh
bundle exec rake sidekiq_cron:load
```

It expects a configuration file at `config/sidekiq_cron.yml` in this format:

```yml
default: &defaults
  rake task does stuff:
    cron: "42 0 * * *"
    class: "RakeTaskJob"
    args:
      - does:stuff

development:
  <<: *defaults

staging:
  <<: *defaults

production:
  <<: *defaults
```

You can configure the location of this file, as well as name prefixes for tasks:

```rb
Sidekiq::Cron::Tasks.configure do |config|
  config.file = "/custom/file/path"
  config.prefix = "notmyprefix"
end
```

#### Capistrano

You can enable this task for Capistrano deployment. It runs around the same time
that Rails' db migrations do. To enable it:

```rb
# Capfile
require 'capistrano/sidekiq-cron'
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-cron-tasks'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sidekiq-cron-tasks
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

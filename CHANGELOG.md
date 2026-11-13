## Unreleased

- Update vulnerable development dependencies while retaining Rails 6.0 and the gem's runtime requirements.
- Load Logger explicitly when booting the Rails 6.0 test application.
- Update the development debugger for the locked bundle's Ruby 3.2 minimum.
- Document remaining Rails and older Sidekiq-Cron security limitations.

## 3.0.1 (October 31, 2017)

- Remove hard dependency on `capistrano-rails` which loads `assets` and `migrations` tasks. Instead, deep require `capistrano/rails/migrations`. [@dadooda](https://github.com/dadooda) in [#6](https://github.com/coverhound/sidekiq-cron-tasks/pull/6)

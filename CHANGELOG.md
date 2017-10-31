## 3.0.1 (October 31, 2017)

- Remove hard dependency on `capistrano-rails` which loads `assets` and `migrations` tasks. Instead, deep require `capistrano/rails/migrations`. [@dadooda](https://github.com/dadooda) in [#6](https://github.com/coverhound/sidekiq-cron-tasks/pull/6)

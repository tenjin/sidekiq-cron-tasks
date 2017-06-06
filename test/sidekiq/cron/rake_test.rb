require "test_helper"
require "minitest/spec"

module Sidekiq::Cron
  class RakeTest < ActiveSupport::TestCase
    extend Minitest::Spec::DSL

    let(:rake) { Rake::Application.new }

    %w[sidekiq_cron:load sidekiq_cron:clear].each do |task_name|
      before do
        Rake.application = rake
        Rake.load_rakefile(
          GEM_LIB_PATH.join("tasks/sidekiq_cron/tasks.rake").to_s
        )
        Rake::Task.define_task(:environment)
      end

      describe task_name do
        it "runs" do
          rake[task_name].invoke
        end
      end
    end
  end
end

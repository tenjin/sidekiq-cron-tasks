require "test_helper"
require "minitest/spec"

module Sidekiq::Cron
  class TasksTest < ActiveSupport::TestCase
    extend Minitest::Spec::DSL

    describe "config" do
      it "is a Configuration" do
        assert_kind_of Tasks::Configuration, Tasks.config
      end
    end

    describe "configure" do
      it "yields to config" do
        Tasks.configure do |config|
          assert_kind_of Tasks::Configuration, config
        end
      end
    end
  end
end

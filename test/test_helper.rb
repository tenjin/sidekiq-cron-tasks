# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

GEM_LIB_PATH = Pathname.new(File.expand_path("../../lib", __FILE__))
DUMMY_APP_PATH = Pathname.new(File.expand_path("../../test/dummy", __FILE__))
require DUMMY_APP_PATH.join("config/environment.rb")
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

if Rails.version.to_i >= 5
  Rails::TestUnitReporter.executable = 'bin/test'
end

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

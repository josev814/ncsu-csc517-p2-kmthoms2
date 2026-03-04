ENV["RAILS_ENV"] ||= "test"

# Start SimpleCov before loading the application to ensure accurate coverage tracking
require "simplecov"
SimpleCov.start "rails" do
  # Only measure coverage for files in the app/ directory
  add_filter "/test/"
  add_filter "/config/"
  add_filter "/vendor/"
  coverage_dir "coverage"
  # Ensure all app/ files are tracked even if not loaded by tests
  track_files "app/**/*.rb"
end

require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors, with: :threads)
    parallelize(workers: 1)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

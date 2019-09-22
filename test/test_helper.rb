require 'simplecov'
SimpleCov.start('rails') do
  add_filter 'app/jobs'
  add_filter 'app/mailers'
  add_filter 'app/channels'
  add_filter 'bin/spring'
  add_filter 'bin/rails'
end

ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

end

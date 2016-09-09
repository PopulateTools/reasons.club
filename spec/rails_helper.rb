# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rspec'
require 'email_spec'
require 'omniauth'
require 'rack/test'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!
  config.include(Factories)
  config.include(Paths)
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

  OmniAuth.config.test_mode = true
  Capybara.javascript_driver = :selenium
  Capybara.default_max_wait_time = 5
  Capybara.server_port = 31337

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:transaction)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:each) do
    Timecop.return
    reset_mailer
  end
end

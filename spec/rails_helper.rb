ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/json_expectations'
require 'database_cleaner/active_record'
require 'json_spec'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
    Rails.application.load_seed
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
  
  def user_params(email = "johndoe@example.com", password = "password123")
    {
      email: email,
      password: password,
      password_confirmation: password
    }
  end
end



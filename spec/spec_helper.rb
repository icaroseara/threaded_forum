ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'capybara/rspec'
require 'yaml'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include PostHelpers, type: :feature
  config.include CommentHelpers, type: :feature
  
  config.before(:suite) do
    require "#{Rails.root}/db/seeds.rb"
  end
    
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Webmock/vcr stuff
require 'webmock/rspec'
require_relative 'vcr_helper'

module JsonHelpers
  def response_json
    @response_json ||= JSON.parse(response.body, symbolize_names: true)
  end
end

RSpecStripe.configure do |config|
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.order = "random"
  config.fixture_path = "spec/fixtures"
  config.include Rails.application.routes.url_helpers
  config.include JsonHelpers, type: :controller
  config.use_transactional_fixtures = false
end

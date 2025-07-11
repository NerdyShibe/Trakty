# frozen_string_literal: true

require 'webmock/rspec'

# Disable real HTTP requests in the tests
WebMock.disable_net_connect!(allow_localhost: true)

require_relative '../lib/trakty'
Dir[File.join(__dir__, 'support/**/*.rb')].sort.each { |f| require f }

#
# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include RequestHelper

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

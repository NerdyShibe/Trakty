# frozen_string_literal: true

require 'dotenv/load'
require 'debug'
require 'faraday'
require 'json'

require_relative 'trakty/client'
require_relative 'trakty/errors'
require_relative 'trakty/version'

require_relative 'trakty/resources/base'
require_relative 'trakty/resources/movies'
require_relative 'trakty/resources/users'

require_relative 'trakty/services/authenticator'
require_relative 'trakty/services/error_handler'
require_relative 'trakty/services/request_builder'

#
# Trakt Rest API Client
module Trakty
  client = Trakty::Client.new

  client.users('mr_shibe69').watching
end

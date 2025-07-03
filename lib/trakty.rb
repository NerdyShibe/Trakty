# frozen_string_literal: true

require 'dotenv/load'
require 'faraday'
require 'json'

require_relative 'trakty/auth'
require_relative 'trakty/client'
require_relative 'trakty/request_handler'
require_relative 'trakty/version'

require_relative 'trakty/resources/base'
require_relative 'trakty/resources/movies'

#
# Trakt Rest API Client
module Trakty; end

Trakty::Client.new

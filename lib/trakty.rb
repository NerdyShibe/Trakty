# frozen_string_literal: true

require 'dotenv/load'
require 'debug'
require 'faraday'
require 'json'

require_relative 'trakty/client'
require_relative 'trakty/errors'

require_relative 'trakty/resources/base'
require_relative 'trakty/resources/genres'
require_relative 'trakty/resources/movies'
require_relative 'trakty/resources/search'
require_relative 'trakty/resources/shows'
require_relative 'trakty/resources/users'

require_relative 'trakty/services/authenticator'
require_relative 'trakty/services/error_handler'
require_relative 'trakty/services/request_builder'

#
# Trakt Rest API Client
module Trakty
  VERSION = '0.0.1'

  client = Trakty::Client.new

  response = client.movies.trending
                   .page(2)
                   .limit(10)
                   .extended_info('metadata')
                   .query('dark')
                   .by_genres('action')
                   .by_years(2008)
                   .by_languages('en')
                   .by_countries('us')
                   .all

  puts response.status
  puts response.body
end

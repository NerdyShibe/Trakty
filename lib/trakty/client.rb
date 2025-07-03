# frozen_string_literal: true

module Trakty
  #
  # Describes the API Client
  class Client
    BASE_URL = 'https://api.trakt.tv/'

    attr_accessor :access_token, :refresh_token

    def authenticate
      Trakty::Auth.new(self)
    end

    def movies
      Trakty::Resources::Movies.new(self)
    end

    def connection
      @connection = Faraday.new(url: BASE_URL, ssl: { verify: false }) do |conn|
        conn.request  :json
        conn.response :json
        conn.response :logger
        conn.adapter  :net_http

        conn.headers['Content-Type']      = 'application/json'
        conn.headers['trakt-api-version'] = '2'
        conn.headers['trakt-api-key']     = ENV['TRAKT_CLIENT_ID']
      end
    end
  end
end

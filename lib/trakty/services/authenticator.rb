# frozen_string_literal: true

module Trakty
  ##
  # Implements the OAuth2 authentication
  class Authenticator
    def initialize(client)
      @client = client

      generate_codes
    end

    private

    attr_accessor :user_code, :device_code

    #
    # Generate the user and device code
    # Device code needs to be stored
    # User code needs to be used in /validate
    def generate_codes
      puts '1. Requesting a device code from Trakt...'

      payload = { 'client_id' => ENV['TRAKT_CLIENT_ID'] }

      response = @client.connection.post('oauth/device/code', payload) do |conn|
        conn.headers['Content-Type'] = 'application/json'
      end

      # Response body: {
      #   "device_code" => "2a0ddce9cf41e99b6c8cf4660b73d072aff780cff5f1f8ad3dbd9ab30e3f8f96",
      #   "user_code" => "AE0F70A3",
      #   "verification_url" => "https://trakt.tv/activate",
      #   "expires_in" => 600,
      #   "interval" => 5
      # }
      #

      if response.status == 200
        puts 'Successfully fetched the user+device code'
        @device_code = response.body['device_code']
        @user_code = response.body['user_code']
        @verification_url = response.body['verification_url']
        @expires_in = response.body['expires_in']
        @interval = response.body['interval']

        puts "Code succesfully generated: #{@user_code}"
        puts "Please go to #{@verification_url} to activate the app"
      else
        puts 'Error generating codes'
      end

      puts "Response code: #{response.status}"
      puts "Response body: #{response.body}"
    end

    def poll_authorization
      puts '2. Polling for authorization...'
      puts "The code will be valid for the next #{@expires_in / 60} minutes"
      time_limit = Time.now + @expires_in.seconds

      while Time.now < time_limit
        puts 'Querying to check if the user is authorized'
        puts "Will be checking every #{@interval} seconds"
        response = @client.connection.post('oauth/device/code', payload) do |conn|
          conn.headers['Content-Type'] = 'application/json'
        end

        if response.status == 200
          puts 'User was successfully authorized'
          break
        end

        sleep(@interval)
      end
    end
  end
end

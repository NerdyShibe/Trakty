# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Responsible to handle the endpoints for the Users API resource
    class Genres < Base
      #
      # @param client [Trakty::Client] => Main client instance
      # @param type [String] => Either 'movies' or 'shows'
      def initialize(client)
        super(client)

        list
      end

      #
      # Returns a list of all genres, including names and slugs
      def list
        Services::RequestBuilder.new(self, %w[genres])
      end
    end
  end
end

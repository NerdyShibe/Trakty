# frozen_string_literal: true

module Trakty
  module Resources
    #
    # All other resources should inherit from this
    # Will handle the logic for the REST HTTP methods
    class Base
      def initialize(client)
        @client = client
      end

      # TODO: Handle errors
      def get(path, params = nil)
        response = @client.connection.get(path, params)

        puts JSON.pretty_generate(response.body)
      end

      # TODO: Implement the other HTTP methods
      def post; end
      def put; end
      def delete; end
    end
  end
end

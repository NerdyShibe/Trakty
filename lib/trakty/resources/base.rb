# frozen_string_literal: true

module Trakty
  module Resources
    #
    # All other resources should inherit from this
    # Will handle the logic for the REST HTTP methods
    class Base
      def initialize(client, id = nil)
        @client = client
        @id = id
      end

      def get(path, params = nil)
        @client.connection.get(path, params)
      end

      # TODO: Implement the other HTTP methods
      def post; end
      def put; end
      def delete; end
    end
  end
end

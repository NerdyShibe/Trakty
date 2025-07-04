# frozen_string_literal: true

require 'forwardable'

module Trakty
  module Resources
    #
    # All other resources should inherit from this
    # Will handle the logic for the REST HTTP methods
    class Base
      extend Forwardable

      def initialize(client)
        @client = client
      end

      #
      # DRY way of accessing the HTTP methods from the client
      def_delegators :@client, :get, :post, :put, :delete
    end
  end
end

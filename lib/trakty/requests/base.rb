# frozen_string_literal: true

module Trakty
  module Requests
    #
    # Defines the base structure of the requests
    class Base
      def initialize(resource, path = [], params = {})
        @resource = resource
        @path = path
        @params = params
      end
    end
  end
end

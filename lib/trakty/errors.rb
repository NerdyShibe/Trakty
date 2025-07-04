# frozen_string_literal: true

module Trakty
  #
  # Base Error class to provide more user-friendly feedback messages
  class BaseError < StandardError
    def initialize(message = nil, response: nil)
      @response = response

      super(message)
    end
  end

  #
  # Handle errors that were caused by the Client
  # 4xx status codes
  class ClientError < BaseError; end

  #
  # Handle errors that were caused by the Server
  # 5xx status codes
  class ServerError < BaseError; end

  class ForbiddenError < ClientError; end
  class NotFoundError < ClientError; end
end

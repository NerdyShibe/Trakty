# frozen_string_literal: true

module Trakty
  module Services
    #
    # Custom Middleware for better error messages
    class ErrorHandler < Faraday::Middleware
      ERROR_MAP = {
        # 400 => BadRequestError,
        # 401 => UnauthorizedError,
        403 => Trakty::ForbiddenError,
        404 => Trakty::NotFoundError
        # 405 => MethodNotAllowedError,
        # 409 => ConflictError,
        # 422 => UnprocessableEntityError,
        # 429 => RateLimitExceededError
      }.freeze

      # This method is called by Faraday after a response is received
      def on_complete(env)
        status = env.status
        return unless (400..599).cover?(status)

        error_class = ERROR_MAP[status] || ClientError

        # Extract the Trakt-specific error message if available
        body = env.body
        message = body.is_a?(Hash) ? body['error_description'] || body['error'] : 'Unknown error'

        message = 'Resource was not found, can you try a different ID?' if status == 404

        raise error_class.new(message, response: env)
      end
    end
  end
end

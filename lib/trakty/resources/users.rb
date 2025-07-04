# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Responsible to handle the endpoints for the Users API resource
    class Users < Base
      #
      # Returns a movie or episode if the user is currently watching something.
      # If they are not, it returns no data and a 204 HTTP status code.
      #
      # OAuth is optional
      # Extended Info available ?extended=value
      def watching
        get("users/#{@id}/watching")
      end

      #
      # Returns all movies or shows a user has watched sorted by most plays.
      #
      # OAuth is optional
      # Extended Info available ?extended=value
      #
      # @param type [String] => 'movies' || 'shows'
      def watched(type)
        get("users/#{@id}/watched/#{type}")
      end

      #
      # Returns stats about the movies, shows, and episodes a user has watched,
      # collected, and rated.
      #
      # OAuth is optional
      def stats
        get("users/#{@id}/stats")
      end
    end
  end
end

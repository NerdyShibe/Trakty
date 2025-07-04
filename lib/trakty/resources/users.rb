# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Responsible to handle the endpoints for the Users API resource
    class Users < Base
      def initialize(client, user_id)
        super(client)
        @user_id = user_id
      end

      #
      # Returns a movie or episode if the user is currently watching something.
      # If they are not, it returns no data and a 204 HTTP status code.
      #
      # OAuth is optional
      # Extended Info available ?extended=value
      def watching
        get("users/#{@user_id}/watching")
      end

      #
      # Returns all movies or shows a user has watched sorted by most plays.
      #
      # OAuth is optional
      # Extended Info available ?extended=value
      #
      # @param type [String] => Can be either 'movies' or 'shows'
      def watched(type)
        get("users/#{@user_id}/watched/#{type}")
      end

      #
      # Returns stats about the movies, shows, and episodes a user has watched,
      # collected, and rated.
      #
      # OAuth is optional
      def stats
        get("users/#{@user_id}/stats")
      end
    end
  end
end

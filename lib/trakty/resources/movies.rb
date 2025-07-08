# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Will handle endpoints for Movies
    class Movies < Base
      #
      # Returns the most watched movies in the last 24h
      # Movies with the most watchers are returned first
      #
      # Supports: Pagination + Extended Info + Filters
      def trending
        options = { pagination: true, extended: true, filters: true }

        Trakty::Services::RequestBuilder.new(self, %w[movies trending], options)
      end

      #
      # Returns the most popular movies. Popularity is calculated
      # using the rating percentage and the number of ratings.
      #
      # Supports: Pagination + Extended Info + Filters
      def popular
        Trakty::Services::RequestBuilder.new(self, %w[movies popular])
      end

      #
      # Returns the most favorited movies in the specified time period
      #
      # Supports: Pagination + Extended Info + Filters
      def favorited(period)
        path = "movies/favorited/#{period}"
        Trakty::Services::RequestBuilder.new(self, %w[movies favorited])
      end

      #
      # Returns the most favorited movies in the specified time period
      #
      # Supports: Extended Info
      def summary
        Trakty::RequestHandler.new(self, %w[movies])
      end
    end
  end
end

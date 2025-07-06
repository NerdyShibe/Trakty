# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Will handle endpoints for Shows
    class Shows < Base
      #
      # Returns the most watched shows in the last 24h
      # Shows with the most watchers are returned first
      #
      # Supports: Pagination + Extended Info + Filters
      def trending
        Trakty::Services::RequestBuilder.new(self, %w[shows trending])
      end

      #
      # Returns the most popular shows. Popularity is calculated
      # using the rating percentage and the number of ratings.
      #
      # Supports: Pagination + Extended Info + Filters
      def popular
        Trakty::Services::RequestBuilder.new(self, %w[shows popular])
      end
    end
  end
end

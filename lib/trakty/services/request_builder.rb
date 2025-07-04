# frozen_string_literal: true

module Trakty
  module Services
    #
    # Defines the valid params to query
    # Allows chaining methods to build the final query
    # Performs the request at the end
    class RequestBuilder
      VALID_PAGE_PARAMS = %w[page limit].freeze
      VALID_EXTENDED_PARAMS = %w[full images metadata].freeze
      VALID_FILTER_PARAMS = %w[
        query
        years
        genres
        languages
        countries
        runtimes
        studio_ids
      ].freeze

      VALID_PERIODS = %w[daily weekly monthly all].freeze

      attr_reader :path, :params

      #
      # @param path [Array] => ['movies', 'trending']
      # @param params [Hash] => { 'year' => 2016, 'page' => 2 }
      #
      def initialize(resource, path = [], params = {})
        @resource = resource
        @path = path
        @params = params
      end

      #
      # --- Pagination ---

      #
      # @param page_number [Integer]
      # @returns [Trakty::RequestBuilder]
      def page(page_number)
        @params[:page] = page_number
        self
      end

      def limit(size)
        @params[:limit] = size
        self
      end

      #
      # --- Filters ---

      def by_year(year)
        @params[:year] = year
        self
      end

      def by_genres(*genres)
        @params[:genres] = genres.join(',')
        self
      end

      #
      # Path alters

      def by_period(period = 'weekly')
        @path << period
        self
      end

      def by_id(id)
        @path << id
        self
      end

      def fetch
        @resource.get(@path.join('/'), params: @params)
      end

      alias all fetch

      private

      def validate_period(period)
        return if VALID_PERIODS.include?(period)

        message = "Invalid period provided. Must be one of: #{VALID_PERIODS}"
        raise ArgumentError, message
      end
    end
  end
end

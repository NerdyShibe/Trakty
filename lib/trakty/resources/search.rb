# frozen_string_literal: true

module Trakty
  module Resources
    #
    # Handle Searches endpoints
    class Search < Base
      def movies(query)
        get("search/movie?query=#{query}")
      end

      def shows(query)
        get("search/show?query=#{query}")
      end

      def episodes(query)
        get("search/episode?query=#{query}")
      end

      def people(query)
        get("search/person?query=#{query}")
      end

      def lists(query)
        get("search/list?query=#{query}")
      end
    end
  end
end

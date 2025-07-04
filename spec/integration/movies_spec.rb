# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trakty::Resources::Movies do
  let(:client) { Trakty::Client.new }

  # GET /movies/trending
  # TODO: Test the Pagination, Extended Info and Filters
  describe '#trending' do
    before do
      stub_request(:get, 'https://api.trakt.tv/movies/trending')
        .with(headers: default_headers)
        .to_return(
          status: 200,
          body: File.read('spec/fixtures/movies/trending.json'),
          headers: {
            'Content-Type' => 'application/json',
            'X-Pagination-Page' => 1,
            'X-Pagination-Limit' => 10,
            'X-Pagination-Page-Count' => 10,
            'X-Pagination-Item-Count' => 100,
            'X-Trending-User-Count' => 1721
          }
        )

      # Faraday::Response object already parsed to JSON
      response = client.movies.trending.all
      @trending_movies = response.body
    end

    it 'returns the most watched movies in the last 24h' do
      expect(@trending_movies).to be_a(Array)
      expect(@trending_movies.size).to eq(2)
    end

    it 'returns the correct information for each movie' do
      expect(@trending_movies.first['watchers']).to eq(21)
      expect(@trending_movies.first['movie']['title']).to eq('TRON: Legacy')
      expect(@trending_movies.first['movie']['year']).to eq(2010)
      expect(@trending_movies.first['movie']['ids']['trakt']).to eq(1)
    end
  end
end

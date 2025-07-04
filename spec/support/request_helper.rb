# frozen_string_literal: true

module RequestHelper
  def default_headers
    {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type' => 'application/json',
      'Trakt-Api-Key' => ENV['TRAKT_CLIENT_ID'],
      'Trakt-Api-Version' => '2',
      'User-Agent' => 'Faraday v2.13.1'
    }
  end
end

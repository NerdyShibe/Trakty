# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Trakty::Services::ErrorHandler do
  let(:client) { Trakty::Client.new }

  it 'raises Trakty::NotFoundError on a 404 status' do
    stub_request(:get, 'https://api.trakt.tv/users/does-not-exist/stats')
      .with(headers: default_headers)
      .to_return(status: 404, body: 'Not Found', headers: {})

    expect { client.users('does-not-exist').stats }
      .to raise_error(Trakty::NotFoundError)
  end
end

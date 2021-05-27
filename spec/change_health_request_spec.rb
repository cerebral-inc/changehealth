require "spec_helper"

RSpec.describe ChangeHealth::Request do
  include_context 'with sandbox configuration'

  before do
    stub_request(:post, /sandbox.apis.changehealthcare.com/).
      to_return(
        body: { access_token: 'token' }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  describe '.ping?' do
    before do
      stub_request(:get, /sandbox.apis.changehealthcare.com/).
        to_return(
          body: 'Ping OK',
          headers: { 'Content-Type' => 'application/json' }
        )
    end
    its(:ping?) { is_expected.to be_truthy }
  end
end

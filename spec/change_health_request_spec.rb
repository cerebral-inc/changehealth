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
    context 'with valid credentials' do
      before do
        stub_request(:get, /sandbox.apis.changehealthcare.com/).
          to_return(
            body: 'Ping OK',
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      its(:ping?) { is_expected.to be_truthy }
    end

    context 'with outdated credentials' do
      before do
        expect_any_instance_of(ChangeHealth::Authentication).to receive(:refresh_access_token!)
        stub_request(:get, /sandbox.apis.changehealthcare.com/).
          to_return(
            status: 401,
            body: { error: :access_token_expired }.to_json,
            headers: { 'Content-Type' => 'application/json' }
          )
      end

      its(:ping?) { is_expected.to be_falsey }
    end
  end
end

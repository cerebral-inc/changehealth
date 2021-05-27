require "spec_helper"

RSpec.describe ChangeHealth::Authentication do
  include_context 'with sandbox configuration'

  context 'with a correct recponse' do
    include_context 'with authentication'

    its(:access_token) { is_expected.to eq correct_access_token }
  end

  context 'with invalid credentials' do
    before do
      stub_request(:post, /sandbox.apis.changehealthcare.com/).
        to_return(
          status: 400,
          body: { error: :invalid_client }.to_json,
          headers: { 'Content-Type' => 'application/json' }
        )
    end

    it 'raises an exception' do
      expect { subject.access_token }.to raise_error(::ChangeHealth::AuthError)
    end
  end

  context 'with token persistence' do
    let(:old_token) { 'correct_token' }

    before do
      ::ChangeHealth.configure do |config|
        config.persist_token = lambda do |value|
          File.write('tmp/token.txt', value.to_s)
        end
        config.persisted_token = lambda do
          File.read('tmp/token.txt')
        end
      end

      ChangeHealth.configuration.persist_token.call(old_token)
    end

    its(:access_token) { is_expected.to eq old_token }
  end
end
